//
//  UIDevice.swift
//
//  Created by Inder Kumar Rathore on 06/02/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation
import UIKit

enum Hardware: NSInteger {
  case NOT_AVAILABLE
  
  case IPHONE_2G
  case IPHONE_3G
  case IPHONE_3GS
  case IPHONE_4
  case IPHONE_4_CDMA
  case IPHONE_4S
  case IPHONE_5
  case IPHONE_5_CDMA_GSM
  case IPHONE_5C
  case IPHONE_5C_CDMA_GSM
  case IPHONE_5S
  case IPHONE_5S_CDMA_GSM
  case IPHONE_6_PLUS
  case IPHONE_6
  
  case IPOD_TOUCH_1G
  case IPOD_TOUCH_2G
  case IPOD_TOUCH_3G
  case IPOD_TOUCH_4G
  case IPOD_TOUCH_5G
  
  case IPAD
  case IPAD_2
  case IPAD_2_WIFI
  case IPAD_2_CDMA
  case IPAD_3
  case IPAD_3G
  case IPAD_3_WIFI
  case IPAD_3_WIFI_CDMA
  case IPAD_4
  case IPAD_4_WIFI
  case IPAD_4_GSM_CDMA
  
  case IPAD_MINI
  case IPAD_MINI_WIFI
  case IPAD_MINI_WIFI_CDMA
  case IPAD_MINI_RETINA_WIFI
  case IPAD_MINI_RETINA_WIFI_CDMA
  case IPAD_MINI_3_WIFI
  case IPAD_MINI_3_WIFI_CELLULAR
  case IPAD_MINI_RETINA_WIFI_CELLULAR_CN
  
  case IPAD_AIR_WIFI
  case IPAD_AIR_WIFI_GSM
  case IPAD_AIR_WIFI_CDMA
  case IPAD_AIR_2_WIFI
  case IPAD_AIR_2_WIFI_CELLULAR
  
  case SIMULATOR
}

class UIDeviceUtil {
  
  /** This method retruns the hardware type */
  class func hardwareString() -> String {
    var name: [Int32] = [CTL_HW, HW_MACHINE]
    var size: UInt = 2
    sysctl(&name, 2, nil, &size, &name, 0)
    var hw_machine = [CChar](count: Int(size), repeatedValue: 0)
    sysctl(&name, 2, &hw_machine, &size, &name, 0)
    
    let hardware: String = String.fromCString(hw_machine)!
    return hardware
  }
  
  /** This method returns the Hardware enum depending upon harware string */
  class func hardware() -> Hardware {
    let hardware = self.hardwareString()
    
    if (hardware == "iPhone1,1")         { return Hardware.IPHONE_2G }
    if (hardware == "iPhone1,2")         { return Hardware.IPHONE_3G }
    if (hardware == "iPhone2,1")         { return Hardware.IPHONE_3GS }
    if (hardware == "iPhone3,1")         { return Hardware.IPHONE_4 }
    if (hardware == "iPhone3,2")         { return Hardware.IPHONE_4 }
    if (hardware == "iPhone3,3")         { return Hardware.IPHONE_4_CDMA }
    if (hardware == "iPhone4,1")         { return Hardware.IPHONE_4S }
    if (hardware == "iPhone5,1")         { return Hardware.IPHONE_5 }
    if (hardware == "iPhone5,2")         { return Hardware.IPHONE_5_CDMA_GSM }
    if (hardware == "iPhone5,3")         { return Hardware.IPHONE_5C }
    if (hardware == "iPhone5,4")         { return Hardware.IPHONE_5C_CDMA_GSM }
    if (hardware == "iPhone6,1")         { return Hardware.IPHONE_5S }
    if (hardware == "iPhone6,2")         { return Hardware.IPHONE_5S_CDMA_GSM }
    
    if (hardware == "iPhone7,1")         { return Hardware.IPHONE_6_PLUS }
    if (hardware == "iPhone7,2")         { return Hardware.IPHONE_6 }
    
    if (hardware == "iPod1,1")           { return Hardware.IPOD_TOUCH_1G }
    if (hardware == "iPod2,1")           { return Hardware.IPOD_TOUCH_2G }
    if (hardware == "iPod3,1")           { return Hardware.IPOD_TOUCH_3G }
    if (hardware == "iPod4,1")           { return Hardware.IPOD_TOUCH_4G }
    if (hardware == "iPod5,1")           { return Hardware.IPOD_TOUCH_5G }
    
    if (hardware == "iPad1,1")           { return Hardware.IPAD }
    if (hardware == "iPad1,2")           { return Hardware.IPAD_3G }
    if (hardware == "iPad2,1")           { return Hardware.IPAD_2_WIFI }
    if (hardware == "iPad2,2")           { return Hardware.IPAD_2 }
    if (hardware == "iPad2,3")           { return Hardware.IPAD_2_CDMA }
    if (hardware == "iPad2,4")           { return Hardware.IPAD_2 }
    if (hardware == "iPad2,5")           { return Hardware.IPAD_MINI_WIFI }
    if (hardware == "iPad2,6")           { return Hardware.IPAD_MINI }
    if (hardware == "iPad2,7")           { return Hardware.IPAD_MINI_WIFI_CDMA }
    if (hardware == "iPad3,1")           { return Hardware.IPAD_3_WIFI }
    if (hardware == "iPad3,2")           { return Hardware.IPAD_3_WIFI_CDMA }
    if (hardware == "iPad3,3")           { return Hardware.IPAD_3 }
    if (hardware == "iPad3,4")           { return Hardware.IPAD_4_WIFI }
    if (hardware == "iPad3,5")           { return Hardware.IPAD_4 }
    if (hardware == "iPad3,6")           { return Hardware.IPAD_4_GSM_CDMA }
    if (hardware == "iPad4,1")           { return Hardware.IPAD_AIR_WIFI }
    if (hardware == "iPad4,2")           { return Hardware.IPAD_AIR_WIFI_GSM }
    if (hardware == "iPad4,3")           { return Hardware.IPAD_AIR_WIFI_CDMA }
    if (hardware == "iPad4,4")           { return Hardware.IPAD_MINI_RETINA_WIFI }
    if (hardware == "iPad4,5")           { return Hardware.IPAD_MINI_RETINA_WIFI_CDMA }
    if (hardware == "iPad4,6")           { return Hardware.IPAD_MINI_RETINA_WIFI_CELLULAR_CN }
    if (hardware == "iPad4,7")           { return Hardware.IPAD_MINI_3_WIFI }
    if (hardware == "iPad4,8")           { return Hardware.IPAD_MINI_3_WIFI_CELLULAR }
    if (hardware == "iPad5,3")           { return Hardware.IPAD_AIR_2_WIFI }
    if (hardware == "iPad5,4")           { return Hardware.IPAD_AIR_2_WIFI_CELLULAR }
    
    if (hardware == "i386")              { return Hardware.SIMULATOR }
    if (hardware == "x86_64")            { return Hardware.SIMULATOR }
    if (hardware.hasPrefix("iPhone"))    { return Hardware.SIMULATOR }
    if (hardware.hasPrefix("iPod"))      { return Hardware.SIMULATOR }
    if (hardware.hasPrefix("iPad"))      { return Hardware.SIMULATOR }
    
    //log message that your device is not present in the list
    self.logMessage(hardware)
    
    return Hardware.NOT_AVAILABLE
  }
  
  /** This method returns the readable description of hardware string */
  class func hardwareDescription() -> String? {
    let hardware = self.hardwareString()
    if (hardware == "iPhone1,1")            { return "iPhone 2G" }
    if (hardware == "iPhone1,2")            { return "iPhone 3G" }
    if (hardware == "iPhone2,1")            { return "iPhone 3GS" }
    if (hardware == "iPhone3,1")            { return "iPhone 4 (GSM)" }
    if (hardware == "iPhone3,2")            { return "iPhone 4 (GSM Rev. A)" }
    if (hardware == "iPhone3,3")            { return "iPhone 4 (CDMA)" }
    if (hardware == "iPhone4,1")            { return "iPhone 4S" }
    if (hardware == "iPhone5,1")            { return "iPhone 5 (GSM)" }
    if (hardware == "iPhone5,2")            { return "iPhone 5 (Global)" }
    if (hardware == "iPhone5,3")            { return "iPhone 5C (GSM)" }
    if (hardware == "iPhone5,4")            { return "iPhone 5C (Global)" }
    if (hardware == "iPhone6,1")            { return "iPhone 5S (GSM)" }
    if (hardware == "iPhone6,2")            { return "iPhone 5S (Global)" }
    
    if (hardware == "iPhone7,1")            { return "iPhone 6 Plus" }
    if (hardware == "iPhone7,2")            { return "iPhone 6" }
    
    if (hardware == "iPod1,1")              { return "iPod Touch (1 Gen)" }
    if (hardware == "iPod2,1")              { return "iPod Touch (2 Gen)" }
    if (hardware == "iPod3,1")              { return "iPod Touch (3 Gen)" }
    if (hardware == "iPod4,1")              { return "iPod Touch (4 Gen)" }
    if (hardware == "iPod5,1")              { return "iPod Touch (5 Gen)" }
    
    if (hardware == "iPad1,1")              { return "iPad (WiFi)" }
    if (hardware == "iPad1,2")              { return "iPad 3G" }
    if (hardware == "iPad2,1")              { return "iPad 2 (WiFi)" }
    if (hardware == "iPad2,2")              { return "iPad 2 (GSM)" }
    if (hardware == "iPad2,3")              { return "iPad 2 (CDMA)" }
    if (hardware == "iPad2,4")              { return "iPad 2 (WiFi Rev. A)" }
    if (hardware == "iPad2,5")              { return "iPad Mini (WiFi)" }
    if (hardware == "iPad2,6")              { return "iPad Mini (GSM)" }
    if (hardware == "iPad2,7")              { return "iPad Mini (CDMA)" }
    if (hardware == "iPad3,1")              { return "iPad 3 (WiFi)" }
    if (hardware == "iPad3,2")              { return "iPad 3 (CDMA)" }
    if (hardware == "iPad3,3")              { return "iPad 3 (Global)" }
    if (hardware == "iPad3,4")              { return "iPad 4 (WiFi)" }
    if (hardware == "iPad3,5")              { return "iPad 4 (CDMA)" }
    if (hardware == "iPad3,6")              { return "iPad 4 (Global)" }
    if (hardware == "iPad4,1")              { return "iPad Air (WiFi)" }
    if (hardware == "iPad4,2")              { return "iPad Air (WiFi+GSM)" }
    if (hardware == "iPad4,3")              { return "iPad Air (WiFi+CDMA)" }
    if (hardware == "iPad4,4")              { return "iPad Mini Retina (WiFi)" }
    if (hardware == "iPad4,5")              { return "iPad Mini Retina (WiFi+CDMA)" }
    if (hardware == "iPad4,6")              { return "iPad Mini Retina (Wi-Fi + Cellular CN)" }
    if (hardware == "iPad4,7")              { return "iPad Mini 3 (Wi-Fi)" }
    if (hardware == "iPad4,8")              { return "iPad Mini 3 (Wi-Fi + Cellular)" }
    if (hardware == "iPad5,3")              { return "iPad Air 2 (Wi-Fi)" }
    if (hardware == "iPad5,4")              { return "iPad Air 2 (Wi-Fi + Cellular)" }
    
    if (hardware == "i386")                 { return "Simulator" }
    if (hardware == "x86_64")               { return "Simulator" }
    if (hardware.hasPrefix("iPhone"))       { return "iPhone" }
    if (hardware.hasPrefix("iPod"))         { return "iPod" }
    if (hardware.hasPrefix("iPad"))         { return "iPad" }
    
    //log message that your device is not present in the list
    self.logMessage(hardware)
    
    return nil
  }

  /**
  This method returns the hardware number not actual but logically.
  e.g. if the hardware string is 5,1 then hardware number would be 5.1
  */
  class func hardwareNumber(hardware: Hardware) -> CGFloat {
    switch (hardware) {
    case Hardware.IPHONE_2G:                         return 1.1
    case Hardware.IPHONE_3G:                         return 1.2
    case Hardware.IPHONE_3GS:                        return 2.1
    case Hardware.IPHONE_4:                          return 3.1
    case Hardware.IPHONE_4_CDMA:                     return 3.3
    case Hardware.IPHONE_4S:                         return 4.1
    case Hardware.IPHONE_5:                          return 5.1
    case Hardware.IPHONE_5_CDMA_GSM:                 return 5.2
    case Hardware.IPHONE_5C:                         return 5.3
    case Hardware.IPHONE_5C_CDMA_GSM:                return 5.4
    case Hardware.IPHONE_5S:                         return 6.1
    case Hardware.IPHONE_5S_CDMA_GSM:                return 6.2
    case Hardware.IPHONE_6_PLUS:                     return 7.1
    case Hardware.IPHONE_6:                          return 7.2
      
    case Hardware.IPOD_TOUCH_1G:                     return 1.1
    case Hardware.IPOD_TOUCH_2G:                     return 2.1
    case Hardware.IPOD_TOUCH_3G:                     return 3.1
    case Hardware.IPOD_TOUCH_4G:                     return 4.1
    case Hardware.IPOD_TOUCH_5G:                     return 5.1
      
    case Hardware.IPAD:                              return 1.1
    case Hardware.IPAD_3G:                           return 1.2
    case Hardware.IPAD_2_WIFI:                       return 2.1
    case Hardware.IPAD_2:                            return 2.2
    case Hardware.IPAD_2_CDMA:                       return 2.3
    case Hardware.IPAD_MINI_WIFI:                    return 2.5
    case Hardware.IPAD_MINI:                         return 2.6
    case Hardware.IPAD_MINI_WIFI_CDMA:               return 2.7
    case Hardware.IPAD_3_WIFI:                       return 3.1
    case Hardware.IPAD_3_WIFI_CDMA:                  return 3.2
    case Hardware.IPAD_3:                            return 3.3
    case Hardware.IPAD_4_WIFI:                       return 3.4
    case Hardware.IPAD_4:                            return 3.5
    case Hardware.IPAD_4_GSM_CDMA:                   return 3.6
      
    case Hardware.IPAD_AIR_WIFI:                     return 4.1
    case Hardware.IPAD_AIR_WIFI_GSM:                 return 4.2
    case Hardware.IPAD_AIR_WIFI_CDMA:                return 4.3
    case Hardware.IPAD_AIR_2_WIFI:                   return 5.3
    case Hardware.IPAD_AIR_2_WIFI_CELLULAR:          return 5.4
      
    case Hardware.IPAD_MINI_RETINA_WIFI:             return 4.4
    case Hardware.IPAD_MINI_RETINA_WIFI_CDMA:        return 4.5
    case Hardware.IPAD_MINI_3_WIFI:                  return 4.6
    case Hardware.IPAD_MINI_3_WIFI_CELLULAR:         return 4.7
    case Hardware.IPAD_MINI_RETINA_WIFI_CELLULAR_CN: return 4.8
      
    case Hardware.SIMULATOR:                         return 100.0
    case Hardware.NOT_AVAILABLE:                     return 200.0
    default:                                         return 200.0
    }
  }

  /** 
  This method returns the resolution for still image that can be received
  from back camera of the current device. Resolution returned for image oriented landscape right.
  **/
  class func backCameraStillImageResolutionInPixels(hardware: Hardware) -> CGSize {
    switch (hardware) {
    case Hardware.IPHONE_2G, Hardware.IPHONE_3G:
      return CGSizeMake(1600, 1200)
      
    case Hardware.IPHONE_3GS:
      return CGSizeMake(2048, 1536)
      
    case Hardware.IPHONE_4, Hardware.IPHONE_4_CDMA, Hardware.IPAD_3_WIFI, Hardware.IPAD_3_WIFI_CDMA, Hardware.IPAD_3, Hardware.IPAD_4_WIFI, Hardware.IPAD_4, Hardware.IPAD_4_GSM_CDMA:
      return CGSizeMake(2592, 1936)
      
    case Hardware.IPHONE_4S, Hardware.IPHONE_5, Hardware.IPHONE_5_CDMA_GSM, Hardware.IPHONE_5C, Hardware.IPHONE_5C_CDMA_GSM, Hardware.IPHONE_6, Hardware.IPHONE_6_PLUS:
      return CGSizeMake(3264, 2448)
      
    case Hardware.IPOD_TOUCH_4G:
      return CGSizeMake(960, 720)
      
    case Hardware.IPOD_TOUCH_5G:
      return CGSizeMake(2440, 1605)
      
    case Hardware.IPAD_2_WIFI, Hardware.IPAD_2, Hardware.IPAD_2_CDMA:
      return CGSizeMake(872, 720)
      
    case Hardware.IPAD_MINI_WIFI, Hardware.IPAD_MINI, Hardware.IPAD_MINI_WIFI_CDMA:
      return CGSizeMake(1820, 1304)
      
    case Hardware.IPAD_AIR_2_WIFI, Hardware.IPAD_AIR_2_WIFI_CELLULAR:
      return CGSizeMake (1536, 2048)
      
    default:
      println("We have no resolution for your device's camera listed in this category. Please, make photo with back camera of your device, get its resolution in pixels (via Preview Cmd+I for example) and add a comment to this repository (https://github.com/InderKumarRathore/UIDeviceUtil) on GitHub.com in format Device = Hpx x Wpx.") }
    println("Your device is: \(self.hardwareDescription())")
    
    return CGSizeZero
  }

  /** 
  Internal method for loggin, you don't need this method
  */
  class func logMessage(hardware: String) {
    println("This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/UIDeviceUtil and add a comment there.");
    println("Your device hardware string is: %@", hardware);
  }
}
