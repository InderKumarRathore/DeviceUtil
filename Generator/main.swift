#!/usr/bin/env swift

import Foundation

// MARK: - Functions

struct Model: Hashable {

    let version: Version
    let enumCase: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(enumCase)
    }

    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.enumCase == rhs.enumCase
    }
}

struct Version: Comparable {
    let major: Int
    let minor: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major == rhs.major {
            return lhs.minor < rhs.minor
        } else {
            return lhs.major < rhs.major
        }
    }

    static func == (lhs: Version, rhs: Version) -> Bool {
        lhs.major == rhs.major && lhs.minor == rhs.minor
    }
}

func getUniqueSortedModels(havingPrefix: String, from deviceList: [String: [String: AnyObject]]) -> [Model] {

    let filteredDict = deviceList.filter { $0.key.hasPrefix(havingPrefix) }
    let models: [Model] = filteredDict.compactMap { key, value in

        guard let versionString = findMatch(for: "[\\d]*,[\\d]*", in: key),
              let version =  getVersion(from: versionString),
              let enumCase = value["enum"] as? String else {
            print("Can't create model from this: \(value)")
            return nil
        }
        return Model(version: version, enumCase: enumCase)
    }

    // Get the unique models i.e. ignore models which has same enum, we don't want same enum twice in case that
    // will cause compiler error
    let sortedModels = models.sorted { $0.version < $1.version }
    var modelSet = Set<Model>()
    sortedModels.forEach { modelSet.insert($0) }
    return modelSet.sorted { $0.version < $1.version }
}

func readPropertyList() -> [String: [String: AnyObject]]? {
    var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
    let plistPath: String = "GeneratorDeviceList.plist"
    let plistXML = FileManager.default.contents(atPath: plistPath)!
    do {//convert the data to a dictionary and handle errors.
        let plistData = try PropertyListSerialization.propertyList(from: plistXML,
                                                               options: .mutableContainersAndLeaves,
                                                               format: &propertyListFormat)
        guard let dictionary = plistData as? [String: [String: AnyObject]] else {
            print("Unable to convert plist into dictionary.")
            return nil
        }
        return dictionary
    } catch {
        print("Error reading plist: \(error), format: \(propertyListFormat)")
        return nil
    }
}

func normalizedEnum(_ enumCase: String) -> String {
    let lowerCasedEnum = enumCase.lowercased()
    if lowerCasedEnum == "iphone" || lowerCasedEnum == "ipad" || lowerCasedEnum == "ipod" {
        return "iP" + lowerCasedEnum.dropFirst(2)
    } else if lowerCasedEnum == "x86_64" || lowerCasedEnum == "i386" || lowerCasedEnum == "arm64" {
        return lowerCasedEnum + "_simulator"
    } else {
        return lowerCasedEnum
    }
}

func main() {

    guard let generatorDeviceList = readPropertyList() else { return }
    let tabSpacing = "    "
    let unknownCase = "UNKNOWN"
    let simulateCase = "SIMULATOR"
    var deviceList: [String: [String: AnyObject]] = [:]
    var externString = ""
    var externDefString = ""
    var hardwareFuncContent = ""

    generatorDeviceList.keys.sorted().forEach { hardwareKey in
        var valueDict = generatorDeviceList[hardwareKey]
        guard let enumCase = valueDict?["enum"] as? String else {
            print("Unable to get the enum case.")
            return
        }
        var externConstant = hardwareKey.replacingOccurrences(of: ",", with: "_").replacingOccurrences(of: "-", with: "_")
        if externConstant == "x86_64" || externConstant == "i386" {
            externConstant += "_Simulator"
        }
        externString += "extern NSString* const \(externConstant);\n"
        externDefString += "NSString* const \(externConstant) = @\"\(hardwareKey)\";\n"
        hardwareFuncContent +=  "\(tabSpacing)if ([hardware isEqualToString:\(externConstant)]) return \(enumCase);\n"

        valueDict?.removeValue(forKey: "enum")

        guard let versionString = findMatch(for: "[\\d]*,[\\d]*", in: hardwareKey),
            let version = getVersion(from: versionString) as Version?  else {
            print("Unable to determine version: \(hardwareKey)")

            valueDict?["version"] = "-1" as AnyObject
            deviceList[hardwareKey] = valueDict
            return
        }
       
        valueDict?["version"] = "\(version.major).\(version.minor)" as AnyObject
        deviceList[hardwareKey] = valueDict
    }


    var enumString = "typedef NS_ENUM(NSUInteger, Hardware) {\n\n"

    // Get devices by device type
    let iPhoneModels = getUniqueSortedModels(havingPrefix: "iPhone", from: generatorDeviceList)
    iPhoneModels.forEach {
        enumString += "\n\(tabSpacing)\($0.enumCase),"
    }
    enumString += "\n"

    let iPodModels = getUniqueSortedModels(havingPrefix: "iPod", from: generatorDeviceList)
    iPodModels.forEach {
        enumString += "\n\(tabSpacing)\($0.enumCase),"
    }
    enumString += "\n"

    let iPadModels = getUniqueSortedModels(havingPrefix: "iPad", from: generatorDeviceList)
    iPadModels.forEach {
        enumString += "\n\(tabSpacing)\($0.enumCase),"
    }
    enumString += "\n"

    let watchModels = getUniqueSortedModels(havingPrefix: "Watch", from: generatorDeviceList)
    watchModels.forEach {
        enumString += "\n\(tabSpacing)\($0.enumCase),"
    }
    enumString += "\n"

    let appleTVModels = getUniqueSortedModels(havingPrefix: "AppleTV", from: generatorDeviceList)
    appleTVModels.forEach {
        enumString += "\n\(tabSpacing)\($0.enumCase),"
    }
    enumString += "\n"
    enumString += "\n\(tabSpacing)\(simulateCase),"
    enumString += "\n\(tabSpacing)\(unknownCase)"
    enumString += "\n};"

    let dirPath = "../Source/"

    print("Writing plist.")
    guard (deviceList as NSDictionary).write(toFile: "\(dirPath)DeviceList.plist", atomically: true) else {
        print("Unable to write the plist.")
        return
    }
    print("Plist created.")


    let constantHeaderFile = "DeviceUtil+Constant.h"
    print("Creating \(constantHeaderFile)")
    do {
        let constantHeaderFileConent = "\n"
            + enumString
            + "\n\n"
            + externString
            + "\n"
        try constantHeaderFileConent.write(toFile: dirPath + constantHeaderFile, atomically: true, encoding: .utf8)
        print("Created \(constantHeaderFile)")
    } catch {
        print("Unable to create \(constantHeaderFile)")
        return
    }


    let constantImplFile = "DeviceUtil+Constant.m"
    print("Creating \(constantImplFile)")
    do {
        let constantImplFileConent = "\n#import \"DeviceUtil.h\"\n\n"
            + externDefString
            + "\n\n @implementation DeviceUtil (Constant)"
            + "\n\n- (Hardware)hardware {"
            + "\n\(tabSpacing)NSString *hardware = [self hardwareString];\n"
            + hardwareFuncContent
            + "\n\(tabSpacing)NSLog(@\"This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/DeviceUtil and add a comment there.\");"
            + "\n\(tabSpacing)NSLog(@\"Your device hardware string is: %@\", hardware);"
            + "\n\(tabSpacing)return \(unknownCase);"
            + "\n}"
            + "\n@end\n"
        try constantImplFileConent.write(toFile: dirPath + constantImplFile, atomically: true, encoding: .utf8)
        print("Created \(constantImplFile)")
    } catch {
        print("Unable to create \(constantImplFile)")
        return
    }

}

func findMatch(for regex: String, in text: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
        return results.compactMap {
            guard let range = Range($0.range, in: text) else {
                print("Unable to create the range for: \(text)")
                return nil
            }
            return String(text[range])
        }.first
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return nil
    }
}

func getVersion(from string: String) -> Version? {
    let components = string.components(separatedBy: ",")
    guard components.count == 2 else {
        print("Can't create components of string: \(string)")
        return nil
    }
    let majorString = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
    let minorString = components[1].trimmingCharacters(in: .whitespacesAndNewlines)

    guard let major = Int(majorString), let minor = Int(minorString) else {
        print("Can't create major: \(majorString) and  minor: \(minorString)")
        return nil
    }
    return Version(major: major, minor: minor)
}

// MARK: - Calling Main

main()
