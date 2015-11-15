//
//  DeviceUtil.h
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Hardware) {
  NOT_AVAILABLE,
  
  IPHONE_2G,
  IPHONE_3G,
  IPHONE_3GS,
  
  IPHONE_4,
  IPHONE_4_CDMA,
  IPHONE_4S,
  
  IPHONE_5,
  IPHONE_5_CDMA_GSM,
  IPHONE_5C,
  IPHONE_5C_CDMA_GSM,
  IPHONE_5S,
  IPHONE_5S_CDMA_GSM,
  
  IPHONE_6,
  IPHONE_6_PLUS,
  IPHONE_6S,
  IPHONE_6S_PLUS,
  

  IPOD_TOUCH_1G,
  IPOD_TOUCH_2G,
  IPOD_TOUCH_3G,
  IPOD_TOUCH_4G,
  IPOD_TOUCH_5G,
  IPOD_TOUCH_6G,

  IPAD,
  IPAD_2,
  IPAD_2_WIFI,
  IPAD_2_CDMA,
  IPAD_3,
  IPAD_3G,
  IPAD_3_WIFI,
  IPAD_3_WIFI_CDMA,
  IPAD_4,
  IPAD_4_WIFI,
  IPAD_4_GSM_CDMA,

  IPAD_MINI,
  IPAD_MINI_WIFI,
  IPAD_MINI_WIFI_CDMA,
  IPAD_MINI_RETINA_WIFI,
  IPAD_MINI_RETINA_WIFI_CDMA,
  IPAD_MINI_3_WIFI,
  IPAD_MINI_3_WIFI_CELLULAR,
  IPAD_MINI_3_WIFI_CELLULAR_CN,
  IPAD_MINI_4_WIFI,
  IPAD_MINI_4_WIFI_CELLULAR,

  IPAD_MINI_RETINA_WIFI_CELLULAR_CN,

  IPAD_AIR_WIFI,
  IPAD_AIR_WIFI_GSM,
  IPAD_AIR_WIFI_CDMA,
  IPAD_AIR_2_WIFI,
  IPAD_AIR_2_WIFI_CELLULAR,
  
  IPAD_PRO_WIFI,
  IPAD_PRO_WIFI_CELLULAR,

  SIMULATOR
};

/**
 * Hardware string of devices
 */

static NSString* const iPhone1_1 = @"iPhone1,1";
static NSString* const iPhone1_2 = @"iPhone1,2";
static NSString* const iPhone2_1 = @"iPhone2,1";
static NSString* const iPhone3_1 = @"iPhone3,1";
static NSString* const iPhone3_2 = @"iPhone3,2";
static NSString* const iPhone3_3 = @"iPhone3,3";
static NSString* const iPhone4_1 = @"iPhone4,1";
static NSString* const iPhone5_1 = @"iPhone5,1";
static NSString* const iPhone5_2 = @"iPhone5,2";
static NSString* const iPhone5_3 = @"iPhone5,3";
static NSString* const iPhone5_4 = @"iPhone5,4";
static NSString* const iPhone6_1 = @"iPhone6,1";
static NSString* const iPhone6_2 = @"iPhone6,2";
static NSString* const iPhone7_1 = @"iPhone7,1";
static NSString* const iPhone7_2 = @"iPhone7,2";
static NSString* const iPhone8_1 = @"iPhone8,1";
static NSString* const iPhone8_2 = @"iPhone8,2";

static NSString* const iPod1_1 = @"iPod1,1";
static NSString* const iPod2_1 = @"iPod2,1";
static NSString* const iPod3_1 = @"iPod3,1";
static NSString* const iPod4_1 = @"iPod4,1";
static NSString* const iPod5_1 = @"iPod5,1";
static NSString* const iPod7_1 = @"iPod7,1";

static NSString* const iPad1_1 = @"iPad1,1";
static NSString* const iPad1_2 = @"iPad1,2";
static NSString* const iPad2_1 = @"iPad2,1";
static NSString* const iPad2_2 = @"iPad2,2";
static NSString* const iPad2_3 = @"iPad2,3";
static NSString* const iPad2_4 = @"iPad2,4";
static NSString* const iPad2_5 = @"iPad2,5";
static NSString* const iPad2_6 = @"iPad2,6";
static NSString* const iPad2_7 = @"iPad2,7";
static NSString* const iPad3_1 = @"iPad3,1";
static NSString* const iPad3_2 = @"iPad3,2";
static NSString* const iPad3_3 = @"iPad3,3";
static NSString* const iPad3_4 = @"iPad3,4";
static NSString* const iPad3_5 = @"iPad3,5";
static NSString* const iPad3_6 = @"iPad3,6";
static NSString* const iPad4_1 = @"iPad4,1";
static NSString* const iPad4_2 = @"iPad4,2";
static NSString* const iPad4_3 = @"iPad4,3";
static NSString* const iPad4_4 = @"iPad4,4";
static NSString* const iPad4_5 = @"iPad4,5";
static NSString* const iPad4_6 = @"iPad4,6";
static NSString* const iPad4_7 = @"iPad4,7";
static NSString* const iPad4_8 = @"iPad4,8";
static NSString* const iPad4_9 = @"iPad4,9";
static NSString* const iPad5_1 = @"iPad5,1";
static NSString* const iPad5_2 = @"iPad5,2";
static NSString* const iPad5_3 = @"iPad5,3";
static NSString* const iPad5_4 = @"iPad5,4";
static NSString* const iPad6_7 = @"iPad6,7";
static NSString* const iPad6_8 = @"iPad6,8";

static NSString* const i386_Sim    = @"i386";
static NSString* const x86_64_Sim  = @"x86_64";


@interface DeviceUtil : NSObject

/** This method retruns the hardware type */
+ (NSString*)hardwareString;

/** This method returns the Hardware enum depending upon harware string */
+ (Hardware)hardware;

/** This method returns the readable description of hardware string */
+ (NSString*)hardwareDescription;

/**
 This method returns the hardware number not actual but logically.
 e.g. if the hardware string is 5,1 then hardware number would be 5.1
 */
+ (float)hardwareNumber;

/** This method returns the resolution for still image that can be received
 from back camera of the current device. Resolution returned for image oriented landscape right. **/
+ (CGSize)backCameraStillImageResolutionInPixels;

@end
