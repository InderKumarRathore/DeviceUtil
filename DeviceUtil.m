//
//  DeviceUtil.m
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//
//  Hardware string can be found @http://www.everymac.com
//

#import "DeviceUtil.h"
#include <sys/sysctl.h>

/**
 * Hardware string of devices
 */

NSString* const iPhone1_1 = @"iPhone1,1";
NSString* const iPhone1_2 = @"iPhone1,2";
NSString* const iPhone2_1 = @"iPhone2,1";
NSString* const iPhone3_1 = @"iPhone3,1";
NSString* const iPhone3_2 = @"iPhone3,2";
NSString* const iPhone3_3 = @"iPhone3,3";
NSString* const iPhone4_1 = @"iPhone4,1";
NSString* const iPhone5_1 = @"iPhone5,1";
NSString* const iPhone5_2 = @"iPhone5,2";
NSString* const iPhone5_3 = @"iPhone5,3";
NSString* const iPhone5_4 = @"iPhone5,4";
NSString* const iPhone6_1 = @"iPhone6,1";
NSString* const iPhone6_2 = @"iPhone6,2";
NSString* const iPhone7_1 = @"iPhone7,1";
NSString* const iPhone7_2 = @"iPhone7,2";
NSString* const iPhone8_1 = @"iPhone8,1";
NSString* const iPhone8_2 = @"iPhone8,2";
NSString* const iPhone8_4 = @"iPhone8,4";

NSString* const iPod1_1 = @"iPod1,1";
NSString* const iPod2_1 = @"iPod2,1";
NSString* const iPod3_1 = @"iPod3,1";
NSString* const iPod4_1 = @"iPod4,1";
NSString* const iPod5_1 = @"iPod5,1";
NSString* const iPod7_1 = @"iPod7,1";

NSString* const iPad1_1 = @"iPad1,1";
NSString* const iPad1_2 = @"iPad1,2";
NSString* const iPad2_1 = @"iPad2,1";
NSString* const iPad2_2 = @"iPad2,2";
NSString* const iPad2_3 = @"iPad2,3";
NSString* const iPad2_4 = @"iPad2,4";
NSString* const iPad2_5 = @"iPad2,5";
NSString* const iPad2_6 = @"iPad2,6";
NSString* const iPad2_7 = @"iPad2,7";
NSString* const iPad3_1 = @"iPad3,1";
NSString* const iPad3_2 = @"iPad3,2";
NSString* const iPad3_3 = @"iPad3,3";
NSString* const iPad3_4 = @"iPad3,4";
NSString* const iPad3_5 = @"iPad3,5";
NSString* const iPad3_6 = @"iPad3,6";
NSString* const iPad4_1 = @"iPad4,1";
NSString* const iPad4_2 = @"iPad4,2";
NSString* const iPad4_3 = @"iPad4,3";
NSString* const iPad4_4 = @"iPad4,4";
NSString* const iPad4_5 = @"iPad4,5";
NSString* const iPad4_6 = @"iPad4,6";
NSString* const iPad4_7 = @"iPad4,7";
NSString* const iPad4_8 = @"iPad4,8";
NSString* const iPad4_9 = @"iPad4,9";
NSString* const iPad5_1 = @"iPad5,1";
NSString* const iPad5_2 = @"iPad5,2";
NSString* const iPad5_3 = @"iPad5,3";
NSString* const iPad5_4 = @"iPad5,4";
NSString* const iPad6_3 = @"iPad6,3";
NSString* const iPad6_4 = @"iPad6,4";
NSString* const iPad6_7 = @"iPad6,7";
NSString* const iPad6_8 = @"iPad6,8";

NSString* const i386_Sim    = @"i386";
NSString* const x86_64_Sim  = @"x86_64";


@implementation DeviceUtil
+ (NSString*)hardwareString {
  int name[] = {CTL_HW,HW_MACHINE};
  size_t size = 100;
  sysctl(name, 2, NULL, &size, NULL, 0); // getting size of answer
  char *hw_machine = malloc(size);
  
  sysctl(name, 2, hw_machine, &size, NULL, 0);
  NSString *hardware = [NSString stringWithUTF8String:hw_machine];
  free(hw_machine);
  return hardware;
}

/* This is another way of gtting the system info
 * For this you have to #import <sys/utsname.h>
 */

/*
 NSString* machineName
 {
 struct utsname systemInfo;
 uname(&systemInfo);
 return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
 }
 */


+ (NSDictionary *)getDeviceList {
  // get the bundle of the DeviceUtil if it's main bundle then it returns main bundle
  // if it's DeviceUtil.framework then it returns the DeviceUtil.framework bundle
  NSBundle *deviceUtilTopBundle = [NSBundle bundleForClass:[self class]];
  NSURL *url = [deviceUtilTopBundle URLForResource:@"DeviceUtil" withExtension:@"bundle"];
  NSBundle *deviceUtilBundle;
  if (url != nil) {
    // DeviceUtil bundle is present
    deviceUtilBundle = [NSBundle bundleWithURL:url];
  }
  else {
    // pick the main buncle
    deviceUtilBundle = deviceUtilTopBundle;
  }
  NSString *path = [deviceUtilBundle pathForResource:@"DeviceList" ofType:@"plist"];
  NSDictionary *deviceList = [NSDictionary dictionaryWithContentsOfFile:path];
  NSAssert(deviceList != nil, @"DevicePlist not found in the bundle.");
  return deviceList;
}

+ (Hardware)hardware {
  NSString *hardware = [self hardwareString];
  if ([hardware isEqualToString:iPhone1_1])    return IPHONE_2G;
  if ([hardware isEqualToString:iPhone1_2])    return IPHONE_3G;
  if ([hardware isEqualToString:iPhone2_1])    return IPHONE_3GS;
  
  if ([hardware isEqualToString:iPhone3_1])    return IPHONE_4;
  if ([hardware isEqualToString:iPhone3_2])    return IPHONE_4;
  if ([hardware isEqualToString:iPhone3_3])    return IPHONE_4_CDMA;
  if ([hardware isEqualToString:iPhone4_1])    return IPHONE_4S;
  
  if ([hardware isEqualToString:iPhone5_1])    return IPHONE_5;
  if ([hardware isEqualToString:iPhone5_2])    return IPHONE_5_CDMA_GSM;
  if ([hardware isEqualToString:iPhone5_3])    return IPHONE_5C;
  if ([hardware isEqualToString:iPhone5_4])    return IPHONE_5C_CDMA_GSM;
  if ([hardware isEqualToString:iPhone6_1])    return IPHONE_5S;
  if ([hardware isEqualToString:iPhone6_2])    return IPHONE_5S_CDMA_GSM;
  
  if ([hardware isEqualToString:iPhone7_1])    return IPHONE_6_PLUS;
  if ([hardware isEqualToString:iPhone7_2])    return IPHONE_6;
  if ([hardware isEqualToString:iPhone8_1])    return IPHONE_6S;
  if ([hardware isEqualToString:iPhone8_2])    return IPHONE_6S_PLUS;
  if ([hardware isEqualToString:iPhone8_4])    return IPHONE_SE;

  if ([hardware isEqualToString:iPod1_1])      return IPOD_TOUCH_1G;
  if ([hardware isEqualToString:iPod2_1])      return IPOD_TOUCH_2G;
  if ([hardware isEqualToString:iPod3_1])      return IPOD_TOUCH_3G;
  if ([hardware isEqualToString:iPod4_1])      return IPOD_TOUCH_4G;
  if ([hardware isEqualToString:iPod5_1])      return IPOD_TOUCH_5G;
  if ([hardware isEqualToString:iPod7_1])      return IPOD_TOUCH_6G;
  
  if ([hardware isEqualToString:iPad1_1])      return IPAD;
  if ([hardware isEqualToString:iPad1_2])      return IPAD_3G;
  if ([hardware isEqualToString:iPad2_1])      return IPAD_2_WIFI;
  if ([hardware isEqualToString:iPad2_2])      return IPAD_2;
  if ([hardware isEqualToString:iPad2_3])      return IPAD_2_CDMA;
  if ([hardware isEqualToString:iPad2_4])      return IPAD_2;
  if ([hardware isEqualToString:iPad2_5])      return IPAD_MINI_WIFI;
  if ([hardware isEqualToString:iPad2_6])      return IPAD_MINI;
  if ([hardware isEqualToString:iPad2_7])      return IPAD_MINI_WIFI_CDMA;
  if ([hardware isEqualToString:iPad3_1])      return IPAD_3_WIFI;
  if ([hardware isEqualToString:iPad3_2])      return IPAD_3_WIFI_CDMA;
  if ([hardware isEqualToString:iPad3_3])      return IPAD_3;
  if ([hardware isEqualToString:iPad3_4])      return IPAD_4_WIFI;
  if ([hardware isEqualToString:iPad3_5])      return IPAD_4;
  if ([hardware isEqualToString:iPad3_6])      return IPAD_4_GSM_CDMA;
  if ([hardware isEqualToString:iPad4_1])      return IPAD_AIR_WIFI;
  if ([hardware isEqualToString:iPad4_2])      return IPAD_AIR_WIFI_GSM;
  if ([hardware isEqualToString:iPad4_3])      return IPAD_AIR_WIFI_CDMA;
  if ([hardware isEqualToString:iPad4_4])      return IPAD_MINI_RETINA_WIFI;
  if ([hardware isEqualToString:iPad4_5])      return IPAD_MINI_RETINA_WIFI_CDMA;
  if ([hardware isEqualToString:iPad4_6])      return IPAD_MINI_RETINA_WIFI_CELLULAR_CN;
  if ([hardware isEqualToString:iPad4_7])      return IPAD_MINI_3_WIFI;
  if ([hardware isEqualToString:iPad4_8])      return IPAD_MINI_3_WIFI_CELLULAR;
  if ([hardware isEqualToString:iPad4_9])      return IPAD_MINI_3_WIFI_CELLULAR_CN;
  if ([hardware isEqualToString:iPad5_1])      return IPAD_MINI_4_WIFI;
  if ([hardware isEqualToString:iPad5_2])      return IPAD_MINI_4_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:iPad5_3])      return IPAD_AIR_2_WIFI;
  if ([hardware isEqualToString:iPad5_4])      return IPAD_AIR_2_WIFI_CELLULAR;

  if ([hardware isEqualToString:iPad6_3])      return IPAD_PRO_97_WIFI;
  if ([hardware isEqualToString:iPad6_4])      return IPAD_PRO_97_WIFI_CELLULAR;

  if ([hardware isEqualToString:iPad6_7])      return IPAD_PRO_WIFI;
  if ([hardware isEqualToString:iPad6_8])      return IPAD_PRO_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:i386_Sim])         return SIMULATOR;
  if ([hardware isEqualToString:x86_64_Sim])       return SIMULATOR;
  
  //log message that your device is not present in the list
  [self logMessage:hardware];
  
  return NOT_AVAILABLE;
}

+ (NSString*)hardwareDescription {
  NSString *hardware = [self hardwareString];
  NSDictionary *deviceList = [self getDeviceList];
  NSString *hardwareDescription = [[deviceList objectForKey:hardware] objectForKey:@"name"];
  if (hardwareDescription) {
    return hardwareDescription;
  }
  else {
    //log message that your device is not present in the list
    [self logMessage:hardware];
    
    return nil;
  }
}


+ (float)hardwareNumber {
  NSString *hardware = [self hardwareString];
  NSDictionary *deviceList = [self getDeviceList];
  float version = [[[deviceList objectForKey:hardware] objectForKey:@"version"] floatValue];
  if (version != 0.0f) {
    return version;
  }
  else {
    //log message that your device is not present in the list
    [self logMessage:hardware];
    
    return 200.0f; //device might be new one of missing one so returning 200.0f
  }
}

+ (CGSize)backCameraStillImageResolutionInPixels {
  switch ([self hardware]) {
    case IPHONE_2G:
    case IPHONE_3G:
      return CGSizeMake(1600, 1200);
      break;
    case IPHONE_3GS:
      return CGSizeMake(2048, 1536);
      break;
    case IPHONE_4:
    case IPHONE_4_CDMA:
    case IPAD_3_WIFI:
    case IPAD_3_WIFI_CDMA:
    case IPAD_3:
    case IPAD_4_WIFI:
    case IPAD_4:
    case IPAD_4_GSM_CDMA:
      return CGSizeMake(2592, 1936);
      break;
    case IPHONE_4S:
    case IPHONE_5:
    case IPHONE_5_CDMA_GSM:
    case IPHONE_5C:
    case IPHONE_5C_CDMA_GSM:
    case IPHONE_6:
    case IPHONE_6_PLUS:
    case IPAD_AIR_2_WIFI:
    case IPAD_AIR_2_WIFI_CELLULAR:
      return CGSizeMake(3264, 2448);
      break;
      
    case IPHONE_6S:
    case IPHONE_6S_PLUS:
      return CGSizeMake(4032, 3024);
      break;
      
    case IPOD_TOUCH_4G:
      return CGSizeMake(960, 720);
      break;
    case IPOD_TOUCH_5G:
      return CGSizeMake(2440, 1605);
      break;
      
    case IPAD_2_WIFI:
    case IPAD_2:
    case IPAD_2_CDMA:
      return CGSizeMake(872, 720);
      break;
      
    case IPAD_MINI_WIFI:
    case IPAD_MINI:
    case IPAD_MINI_WIFI_CDMA:
      return CGSizeMake(1820, 1304);
      break;
      
    case IPAD_PRO_97_WIFI:
    case IPAD_PRO_97_WIFI_CELLULAR:
      return CGSizeMake(4032, 3024);
      break;
      
    default:
      NSLog(@"We have no resolution for your device's camera listed in this category. Please, make photo with back camera of your device, get its resolution in pixels (via Preview Cmd+I for example) and add a comment to this repository (https://github.com/InderKumarRathore/DeviceUtil) on GitHub.com in format Device = Hpx x Wpx.");
      NSLog(@"Your device is: %@", [self hardwareDescription]);
      break;
  }
  return CGSizeZero;
}

+ (void)logMessage:(NSString *)hardware {
  NSLog(@"This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/DeviceUtil and add a comment there.");
  NSLog(@"Your device hardware string is: %@", hardware);
}

@end
