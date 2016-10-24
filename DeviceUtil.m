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
  if ([hardware isEqualToString:iPhone9_1])    return IPHONE_7;
  if ([hardware isEqualToString:iPhone9_3])    return IPHONE_7_GSM;
  if ([hardware isEqualToString:iPhone9_2])    return IPHONE_7_PLUS;
  if ([hardware isEqualToString:iPhone9_4])    return IPHONE_7_PLUS_GSM;

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

    case IPHONE_3GS:
      return CGSizeMake(2048, 1536);

    case IPHONE_4:
    case IPHONE_4_CDMA:
    case IPAD_3_WIFI:
    case IPAD_3_WIFI_CDMA:
    case IPAD_3:
    case IPAD_4_WIFI:
    case IPAD_4:
    case IPAD_4_GSM_CDMA:
      return CGSizeMake(2592, 1936);

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

    case IPHONE_6S:
    case IPHONE_6S_PLUS:
    case IPHONE_7:
    case IPHONE_7_GSM:
    case IPHONE_7_PLUS:
    case IPHONE_7_PLUS_GSM:
      return CGSizeMake(4032, 3024);

    case IPOD_TOUCH_4G:
      return CGSizeMake(960, 720);

    case IPOD_TOUCH_5G:
      return CGSizeMake(2440, 1605);

    case IPAD_2_WIFI:
    case IPAD_2:
    case IPAD_2_CDMA:
      return CGSizeMake(872, 720);

    case IPAD_MINI_WIFI:
    case IPAD_MINI:
    case IPAD_MINI_WIFI_CDMA:
      return CGSizeMake(1820, 1304);

    case IPAD_PRO_97_WIFI:
    case IPAD_PRO_97_WIFI_CELLULAR:
      return CGSizeMake(4032, 3024);

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
