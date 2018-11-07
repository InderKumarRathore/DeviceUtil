//
//  DeviceUtil.m
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//
//  Hardware string can be found @https://www.everymac.com
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
NSString* const iPhone9_1 = @"iPhone9,1";
NSString* const iPhone9_2 = @"iPhone9,2";
NSString* const iPhone9_3 = @"iPhone9,3";
NSString* const iPhone9_4 = @"iPhone9,4";
NSString* const iPhone10_1 = @"iPhone10,1";
NSString* const iPhone10_2 = @"iPhone10,2";
NSString* const iPhone10_3 = @"iPhone10,3";
NSString* const iPhone10_4 = @"iPhone10,4";
NSString* const iPhone10_5 = @"iPhone10,5";
NSString* const iPhone10_6 = @"iPhone10,6";
NSString* const iPhone11_2 = @"iPhone11,2";
NSString* const iPhone11_4 = @"iPhone11,4";
NSString* const iPhone11_6 = @"iPhone11,6";
NSString* const iPhone11_8 = @"iPhone11,8";

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
NSString* const iPad6_11 = @"iPad6,11";
NSString* const iPad6_12 = @"iPad6,12";

NSString* const iPad7_1 = @"iPad7,1";
NSString* const iPad7_2 = @"iPad7,2";
NSString* const iPad7_3 = @"iPad7,3";
NSString* const iPad7_4 = @"iPad7,4";
NSString* const iPad7_5 = @"iPad7,5";
NSString* const iPad7_6 = @"iPad7,6";
NSString* const iPad8_1 = @"iPad8,1";
NSString* const iPad8_2 = @"iPad8,2";
NSString* const iPad8_3 = @"iPad8,3";
NSString* const iPad8_4 = @"iPad8,4";
NSString* const iPad8_5 = @"iPad8,5";
NSString* const iPad8_6 = @"iPad8,6";
NSString* const iPad8_7 = @"iPad8,7";
NSString* const iPad8_8 = @"iPad8,8";

NSString* const AppleTV1_1 = @"AppleTV1,1";
NSString* const AppleTV2_1 = @"AppleTV2,1";
NSString* const AppleTV3_1 = @"AppleTV3,1";
NSString* const AppleTV3_2 = @"AppleTV3,2";
NSString* const AppleTV5_3 = @"AppleTV5,3";


NSString* const Watch1_1 = @"Watch1,1";
NSString* const Watch1_2 = @"Watch1,2";
NSString* const Watch2_3 = @"Watch2,3";
NSString* const Watch2_4 = @"Watch2,4";
NSString* const Watch2_6 = @"Watch2,6";
NSString* const Watch2_7 = @"Watch2,7";
NSString* const Watch3_1 = @"Watch3,1";
NSString* const Watch3_2 = @"Watch3,2";
NSString* const Watch3_3 = @"Watch3,3";
NSString* const Watch3_4 = @"Watch3,4";
NSString* const Watch4_1 = @"Watch4,1";
NSString* const Watch4_2 = @"Watch4,2";
NSString* const Watch4_3 = @"Watch4,3";
NSString* const Watch4_4 = @"Watch4,4";


NSString* const i386_Sim    = @"i386";
NSString* const x86_64_Sim  = @"x86_64";


@implementation DeviceUtil {
  NSDictionary *deviceList;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
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
      // pick the main bundle
      deviceUtilBundle = deviceUtilTopBundle;
    }
    NSString *path = [deviceUtilBundle pathForResource:@"DeviceList" ofType:@"plist"];
    deviceList = [NSDictionary dictionaryWithContentsOfFile:path];
    NSAssert(deviceList != nil, @"DevicePlist not found in the bundle.");
  }
  return self;
}

- (NSString*)hardwareString {
  int name[] = {CTL_HW,HW_MACHINE};
  size_t size = 100;
  sysctl(name, 2, NULL, &size, NULL, 0); // getting size of answer
  char *hw_machine = malloc(size);
  
  sysctl(name, 2, hw_machine, &size, NULL, 0);
  NSString *hardware = [NSString stringWithUTF8String:hw_machine];
  free(hw_machine);
  
  // Check if the hardware is simulator
  if ([hardware isEqualToString:i386_Sim] || [hardware isEqualToString:x86_64_Sim]) {
    NSString *deviceID = [[[NSProcessInfo processInfo] environment] objectForKey:@"SIMULATOR_MODEL_IDENTIFIER"];
    if (deviceID != nil) {
      hardware = deviceID;
    }
  }
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



/// This method returns the Platform enum depending upon hardware string
///
///
/// - returns: `Platform` type of the device
///
- (Platform)platform {
  
  NSString *hardware = [self hardwareString];
  
  if ([hardware hasPrefix:@"iPhone"])     return iPhone;
  if ([hardware hasPrefix:@"iPod"])       return iPodTouch;
  if ([hardware hasPrefix:@"iPad"])       return iPad;
  if ([hardware hasPrefix:@"Watch"])      return AppleWatch;
  if ([hardware hasPrefix:@"AppleTV"])    return AppleTV;
  
  return Unknown;
}


- (Hardware)hardware {
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
  
  if ([hardware isEqualToString:iPhone10_1])    return IPHONE_8_CN;
  if ([hardware isEqualToString:iPhone10_2])    return IPHONE_8_PLUS_CN;
  if ([hardware isEqualToString:iPhone10_3])    return IPHONE_X_CN;
  if ([hardware isEqualToString:iPhone10_4])    return IPHONE_8;
  if ([hardware isEqualToString:iPhone10_5])    return IPHONE_8_PLUS;
  if ([hardware isEqualToString:iPhone10_6])    return IPHONE_X;

  if ([hardware isEqualToString:iPhone11_2])    return IPHONE_XS;
  if ([hardware isEqualToString:iPhone11_4])    return IPHONE_XS_MAX;
  if ([hardware isEqualToString:iPhone11_6])    return IPHONE_XS_MAX_CN;
  if ([hardware isEqualToString:iPhone11_8])    return IPHONE_XR;

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
  
  if ([hardware isEqualToString:iPad6_11])     return IPAD_5_WIFI;
  if ([hardware isEqualToString:iPad6_12])     return IPAD_5_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:iPad7_1])      return IPAD_PRO_2G_WIFI;
  if ([hardware isEqualToString:iPad7_2])      return IPAD_PRO_2G_WIFI_CELLULAR;
  if ([hardware isEqualToString:iPad7_3])      return IPAD_PRO_105_WIFI;
  if ([hardware isEqualToString:iPad7_4])      return IPAD_PRO_105_WIFI_CELLULAR;
	
  if ([hardware isEqualToString:iPad7_5])      return IPAD_6_WIFI;
  if ([hardware isEqualToString:iPad7_6])      return IPAD_6_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:iPad8_1])      return IPAD_PRO_11_WIFI;
  if ([hardware isEqualToString:iPad8_2])      return IPAD_PRO_11_1TB_WIFI;
  if ([hardware isEqualToString:iPad8_3])      return IPAD_PRO_11_WIFI_CELLULAR;
  if ([hardware isEqualToString:iPad8_4])      return IPAD_PRO_11_1TB_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:iPad8_5])      return IPAD_PRO_3G_WIFI;
  if ([hardware isEqualToString:iPad8_6])      return IPAD_PRO_3G_1TB_WIFI;
  if ([hardware isEqualToString:iPad8_7])      return IPAD_PRO_3G_WIFI_CELLULAR;
  if ([hardware isEqualToString:iPad8_8])      return IPAD_PRO_3G_1TB_WIFI_CELLULAR;
  
  if ([hardware isEqualToString:AppleTV1_1])   return APPLE_TV_1G;
  if ([hardware isEqualToString:AppleTV2_1])   return APPLE_TV_2G;
  if ([hardware isEqualToString:AppleTV3_1])   return APPLE_TV_3G;
  if ([hardware isEqualToString:AppleTV3_2])   return APPLE_TV_3_2G;
  if ([hardware isEqualToString:AppleTV5_3])   return APPLE_TV_4G;
  
  if ([hardware isEqualToString:Watch1_1])     return APPLE_WATCH_38;
  if ([hardware isEqualToString:Watch1_2])     return APPLE_WATCH_42;
  if ([hardware isEqualToString:Watch2_3])     return APPLE_WATCH_SERIES_2_38;
  if ([hardware isEqualToString:Watch2_4])     return APPLE_WATCH_SERIES_2_42;
  if ([hardware isEqualToString:Watch2_6])     return APPLE_WATCH_SERIES_1_38;
  if ([hardware isEqualToString:Watch2_7])     return APPLE_WATCH_SERIES_1_42;
  if ([hardware isEqualToString:Watch3_1])     return APPLE_WATCH_SERIES_3_38_CELLULAR;
  if ([hardware isEqualToString:Watch3_2])     return APPLE_WATCH_SERIES_3_42_CELLULAR;
  if ([hardware isEqualToString:Watch3_3])     return APPLE_WATCH_SERIES_3_38;
  if ([hardware isEqualToString:Watch3_4])     return APPLE_WATCH_SERIES_3_42;
  if ([hardware isEqualToString:Watch4_1])     return APPLE_WATCH_SERIES_4_40;
  if ([hardware isEqualToString:Watch4_2])     return APPLE_WATCH_SERIES_4_44;
  if ([hardware isEqualToString:Watch4_3])     return APPLE_WATCH_SERIES_4_40_CELLULAR;
  if ([hardware isEqualToString:Watch4_4])     return APPLE_WATCH_SERIES_4_44_CELLULAR;
  
  if ([hardware isEqualToString:i386_Sim])     return SIMULATOR;
  if ([hardware isEqualToString:x86_64_Sim])   return SIMULATOR;
  
  //log message that your device is not present in the list
  [self logMessage:hardware];
  
  return NOT_AVAILABLE;
}

- (NSString*)hardwareDescription {
  NSString *hardware = [self hardwareString];
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

- (NSString*)hardwareSimpleDescription {
  NSString *hardwareDescription = [self hardwareDescription];
  if (hardwareDescription == nil) {
    return nil;
  }
  NSError *error = nil;
  // this expression matches all strings between round brackets (e.g (Wifi), (GSM)) except the pattern "[0-9]+ Gen"
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\((?![0-9]+ Gen).*\\)" options:NSRegularExpressionCaseInsensitive error:&error];
  NSString *hardwareSimpleDescription = [regex stringByReplacingMatchesInString:hardwareDescription options:0 range:NSMakeRange(0, [hardwareDescription length]) withTemplate:@""];
  if (error) {
    return nil;
  } else {
    return hardwareSimpleDescription;
  }
}

- (float)hardwareNumber {
  NSString *hardware = [self hardwareString];
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

- (CGSize)backCameraStillImageResolutionInPixels {
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
    case IPOD_TOUCH_6G:
    case IPAD_AIR_2_WIFI:
    case IPAD_AIR_2_WIFI_CELLULAR:
    case IPHONE_6S:
    case IPHONE_6S_PLUS:
      return CGSizeMake(3264, 2448);

    case IPHONE_7:
    case IPHONE_7_GSM:
    case IPHONE_7_PLUS:
    case IPHONE_7_PLUS_GSM:
    case IPHONE_8:
    case IPHONE_8_CN:
    case IPHONE_8_PLUS:
    case IPHONE_8_PLUS_CN:
    case IPHONE_X:
    case IPHONE_X_CN:
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

- (void)logMessage:(NSString *)hardware {
  NSLog(@"This is a device which is not listed in this category. Please visit https://github.com/InderKumarRathore/DeviceUtil and add a comment there.");
  NSLog(@"Your device hardware string is: %@", hardware);
}

@end
