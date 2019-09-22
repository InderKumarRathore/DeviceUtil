#!/usr/bin/env swift

import Foundation

// MARK: - Functions

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

func main() {

    guard let generatorDeviceList = readPropertyList() else { return }
    let tabSpacing = "    "
    let unknownCase = "UNKNOWN"
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
        var externConstant = hardwareKey.replacingOccurrences(of: ",", with: "_")
        if externConstant == "x86_64" || externConstant == "i386" {
            externConstant += "_Simulator"
        }
        externString += "extern NSString* const \(externConstant);\n"
        externDefString += "NSString* const \(externConstant) = @\"\(hardwareKey)\";\n"
        hardwareFuncContent +=  "\(tabSpacing)if ([hardware isEqualToString:\(externConstant)]) return \(enumCase);\n"

        valueDict?.removeValue(forKey: "enum")
        deviceList[hardwareKey] = valueDict
    }


    var enumString = "typedef NS_ENUM(NSUInteger, Hardware) {\n\(tabSpacing)\(unknownCase)"
    let allEunumCases = generatorDeviceList.keys.compactMap { generatorDeviceList[$0]?["enum"] as? String }
    let enumSet = Set(allEunumCases)
    enumSet.map { $0 }.sorted().forEach { enumCase in
        enumString += ",\n\(tabSpacing)\(enumCase)"
    }
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
        let constantHeaderFileConent = "\n#import \"DeviceUtil.h\"\n\n"
            + enumString
            + "\n\n"
            + externString
            + "\n@interface DeviceUtil (Constant)"
            + "\n\n/// This method returns the Hardware enum depending upon hardware string"
            + "\n- (Hardware)hardware;"
            + "\n@end"
        try constantHeaderFileConent.write(toFile: dirPath + constantHeaderFile, atomically: true, encoding: .utf8)
        print("Created \(constantHeaderFile)")
    } catch {
        print("Unable to create \(constantHeaderFile)")
        return
    }


    let constantImplFile = "DeviceUtil+Constant.m"
    print("Creating \(constantImplFile)")
    do {
        let constantImplFileConent = "\n#import \"\(constantHeaderFile)\"\n\n"
            + externDefString
            + "\n\n @implementation DeviceUtil (Constant)"
            + "\n\n- (Hardware)hardware {"
            + "\n\(tabSpacing)NSString *hardware = [self hardwareString];\n"
            + hardwareFuncContent
            + "\n\(tabSpacing)NSLog(@\"This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/DeviceUtil and add a comment there.\");"
            + "\n\(tabSpacing)NSLog(@\"Your device hardware string is: %@\", hardware);"
            + "\n\(tabSpacing)return \(unknownCase);"
            + "\n}"
            + "\n@end"
        try constantImplFileConent.write(toFile: dirPath + constantImplFile, atomically: true, encoding: .utf8)
        print("Created \(constantImplFile)")
    } catch {
        print("Unable to create \(constantImplFile)")
        return
    }

}

// MARK: - Calling Main

main()
