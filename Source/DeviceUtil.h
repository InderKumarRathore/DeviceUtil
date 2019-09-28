//
//  DeviceUtil.h
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceUtil+Constant.h"

/// Enum of the different Apple's device platforms
typedef NS_ENUM(NSUInteger, Platform) {
  iPhone,
  iPodTouch,
  iPad,
  AppleTV,
  AppleWatch,
  Unknown
};


@interface DeviceUtil : NSObject

/// This method returns the hardware type
- (NSString*)hardwareString;

/// This method returns the Platform enum depending upon hardware string
- (Platform)platform;



/// This method returns the readable description of hardware string
- (NSString*)hardwareDescription;

/// This method returns the readable simple description of hardware string
- (NSString*)hardwareSimpleDescription;

/// This method returns the hardware number not actual but logically. e.g. if the hardware string is 5,1 then hardware number would be 5.1
- (float)hardwareNumber;

/// This method returns if we are running in the simulator
- (BOOL)isSimulator;

/// This method returns the resolution for still image that can be received from back camera of the current device. Resolution returned for image oriented landscape right.
- (CGSize)backCameraStillImageResolutionInPixels;

@end


@interface DeviceUtil (Constant)

/// This method returns the Hardware enum depending upon hardware string
- (Hardware)hardware;
@end
