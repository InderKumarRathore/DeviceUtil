//
//  DeviceUtil.m
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//
//  Hardware string can be found @https://www.everymac.com
//

#import "DeviceUtil.h"
#import "DeviceUtil+Constant.h"
#include <sys/sysctl.h>

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

- (NSString*)nativeHardwareString {
    int name[] = {CTL_HW,HW_MACHINE};
    size_t size = 100;
    sysctl(name, 2, NULL, &size, NULL, 0); // getting size of answer
    char *hw_machine = malloc(size);
    
    sysctl(name, 2, hw_machine, &size, NULL, 0);
    NSString *hardware = [NSString stringWithUTF8String:hw_machine];
    free(hw_machine);
    
    return hardware;
}

- (NSString*)hardwareString {
  NSString *hardware = [self nativeHardwareString];
  
  // Check if the hardware is simulator
  if ([hardware isEqualToString:i386_Simulator] || [hardware isEqualToString:x86_64_Simulator]) {
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

- (Hardware)nativeHardware {
    NSString *hardware = [self nativeHardwareString];
    if ([hardware isEqualToString:i386_Simulator])     return SIMULATOR;
    if ([hardware isEqualToString:x86_64_Simulator])   return SIMULATOR;
    return [self hardware];
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

- (BOOL)isSimulator {
    return [self nativeHardware] == SIMULATOR;
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
    case IPAD_MINI_4_WIFI:
    case IPAD_MINI_4_WIFI_CELLULAR:
    case IPAD_MINI_5_WIFI:
    case IPAD_MINI_5_WIFI_CELLULAR:
    case IPAD_AIR_3_WIFI:
    case IPAD_AIR_3_WIFI_CELLULAR:
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
