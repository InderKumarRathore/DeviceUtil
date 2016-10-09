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
  IPHONE_SE,

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

  IPAD_PRO_97_WIFI,
  IPAD_PRO_97_WIFI_CELLULAR,

  IPAD_PRO_WIFI,
  IPAD_PRO_WIFI_CELLULAR,

  SIMULATOR,

  HARDWARE_MAX
};

/**
 * Hardware string of devices
 */

extern NSString* const iPhone1_1;
extern NSString* const iPhone1_2;
extern NSString* const iPhone2_1;
extern NSString* const iPhone3_1;
extern NSString* const iPhone3_2;
extern NSString* const iPhone3_3;
extern NSString* const iPhone4_1;
extern NSString* const iPhone5_1;
extern NSString* const iPhone5_2;
extern NSString* const iPhone5_3;
extern NSString* const iPhone5_4;
extern NSString* const iPhone6_1;
extern NSString* const iPhone6_2;
extern NSString* const iPhone7_1;
extern NSString* const iPhone7_2;
extern NSString* const iPhone8_1;
extern NSString* const iPhone8_2;
extern NSString* const iPhone8_4;

extern NSString* const iPod1_1;
extern NSString* const iPod2_1;
extern NSString* const iPod3_1;
extern NSString* const iPod4_1;
extern NSString* const iPod5_1;
extern NSString* const iPod7_1;

extern NSString* const iPad1_1;
extern NSString* const iPad1_2;
extern NSString* const iPad2_1;
extern NSString* const iPad2_2;
extern NSString* const iPad2_3;
extern NSString* const iPad2_4;
extern NSString* const iPad2_5;
extern NSString* const iPad2_6;
extern NSString* const iPad2_7;
extern NSString* const iPad3_1;
extern NSString* const iPad3_2;
extern NSString* const iPad3_3;
extern NSString* const iPad3_4;
extern NSString* const iPad3_5;
extern NSString* const iPad3_6;
extern NSString* const iPad4_1;
extern NSString* const iPad4_2;
extern NSString* const iPad4_3;
extern NSString* const iPad4_4;
extern NSString* const iPad4_5;
extern NSString* const iPad4_6;
extern NSString* const iPad4_7;
extern NSString* const iPad4_8;
extern NSString* const iPad4_9;
extern NSString* const iPad5_1;
extern NSString* const iPad5_2;
extern NSString* const iPad5_3;
extern NSString* const iPad5_4;
extern NSString* const iPad6_3;
extern NSString* const iPad6_4;
extern NSString* const iPad6_7;
extern NSString* const iPad6_8;

extern NSString* const i386_Sim;
extern NSString* const x86_64_Sim;


@interface DeviceUtil : NSObject

/** This method retruns the hardware type */
+ (NSString*)hardwareString;

/** This method returns the Hardware enum depending upon hardware string */
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
