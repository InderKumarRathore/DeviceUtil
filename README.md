# DeviceUtil

### For **Swift** please use [DeviceGuru](https://github.com/InderKumarRathore/DeviceGuru) as below
```sh
pod 'DeviceGuru'
```

*DeviceUtil* helps identifying the exact harware type of the device. e.g. iPhone 6 or iPhone 6s.

  - Easy to use
  - Light weight
  
**From version `4.0.2` it can also identify the simulator type, whether it's iPhone XR or iPhone 6**


### Installation

Go to [https://cocoapods.org](https://cocoapods.org) <br>
Search for DeviceUtil lib <br>
Copy the pod dependency and add that to your pod file. e.g.

```sh
pod 'DeviceUtil'
```

### Usage
```sh
  DeviceUtil *deviceUtil = [[DeviceUtil alloc] init];
  if ([deviceUtil hardware] == IPHONE_5C) {
    NSLog(@"Device is iPhone 5c");
  }
```

### Device codes
##### iPhone
Device | hardware() | hardwareString()
--- | --- | ---
iPhone 2G | ```iphone_2G``` | ```iPhone1,1```
iPhone 3G | ```iphone_3G``` | ```iPhone1,2```
iPhone 3GS | ```iphone_3GS``` | ```iPhone2,1```
iPhone 4 | ```iphone_4``` | ```iPhone3,1```
iPhone 4 | ```iphone_4``` | ```iPhone3,2```
iPhone 4 CDMA| ```iphone_4_CDMA``` | ```iPhone3,3```
iPhone 4s | ```iphone_4S``` | ```iPhone4,1```
iPhone 5 | ```iphone_5``` | ```iPhone5,1```
iPhone 5 CDMA GSM | ```iphone_5_CDMA_GSM``` | ```iPhone5,2```
iPhone 5c | ```iphone_5C``` | ```iPhone5,3```
iPhone 5c CDMA GSM | ```iphone_5C_CDMA_GSM``` | ```iPhone5,4```
iPhone 5s | ```iphone_5S``` | ```iPhone6,1```
iPhone 5s CDMA GSM | ```iphone_5S_CDMA_GSM``` | ```iPhone6,2```
iPhone 6 Plus | ```iphone_6_PLUS``` | ```iPhone7,1```
iPhone 6 | ```iphone_6``` | ```iPhone7,2```
iPhone 6s Plus | ```iphone_6S_PLUS``` | ```iPhone8,2```
iPhone 6s | ```iphone_6S``` | ```iPhone8,1```
iPhone SE | ```iphone_SE``` | ```iPhone8,4```
iPhone 7 | ```iphone_7``` | ```iPhone9,1``` & ```iPhone9,3```
iPhone 7 Plus | ```iphone_7_PLUS``` | ```iPhone9,2``` & ```iPhone9,4```
iPhone 7 | ```iphone_7``` | ```iPhone9,3```
iPhone 7 Plus | ```iphone_7_PLUS``` | ```iPhone9,4```
iPhone 8 | ```iphone_8``` | ```iPhone10,1``` & ```iPhone10,4```
iPhone 8 Plus | ```iphone_8_PLUS``` | ```iPhone10,2``` & ```iPhone10,5```
iPhone X | ```iphone_X``` | ```iPhone10,3``` & ```iPhone10,6```
iPhone XS | ```iphone_XS``` | ```iPhone11,2```
iPhone XS Max | ```iphone_XS_MAX``` | ```iPhone11,4``` & ```iPhone11,6```
iPhone XR | ```iphone_XR``` | ```iPhone11,8```

##### iPod
Device | hardware() | hardwareString()
--- | ---- | ---
iPod Touch 1G | ```ipod_TOUCH_1G``` | ```iPod1,1```
iPod Touch 2G | ```ipod_TOUCH_2G``` | ```iPod2,1```
iPod Touch 3G | ```ipod_TOUCH_3G``` | ```iPod3,1```
iPod Touch 4G | ```ipod_TOUCH_4G``` | ```iPod4,1```
iPod Touch 5G | ```ipod_TOUCH_5G``` | ```iPod5,1```

##### iPad
Device | hardware() | hardwareString()
--- | --- | ---
iPad | ```ipad``` | ```iPad1,1```
iPad 3G | ```ipad_3G``` | ```iPad1,2```
iPad 2 Wifi | ```ipad_2_WIFI``` | ```iPad2,1```
iPad 2 | ```ipad_2 ``` | ```iPad2,2```
iPad 2 CDMA | ```ipad_2_CDMA``` | ```iPad2,3```
iPad 2 | ```ipad_2``` | ```iPad2,4```
iPad Mini WIFI | ```ipad_MINI_WIFI``` | ```iPad2,5```
iPad 3 WIFI | ```ipad_3_WIFI``` | ```iPad3,1```
iPad 3 CDMA | ```ipad_3_WIFI_CDMA``` | ```iPad3,2```
iPad 3 | ```ipad_3``` | ```iPad3,3```
iPad 4 WIFI | ```ipad_4_WIFI``` | ```iPad3,4```
iPad 4 | ```ipad_4``` | ```iPad3,5```
iPad 4 GSM CDMA | ```ipad_4_GSM_CDMA``` | ```iPad3,6```
iPad Air | ```ipad_AIR_WIFI``` | ```iPad4,1```
iPad Air GSM  | ```ipad_AIR_WIFI_GSM``` | ```iPad4,2```
iPad Air CDMA  | ```ipad_AIR_WIFI_CDMA``` | ```iPad4,3```
iPad Mini Retina  | ```ipad_MINI_RETINA_WIFI``` | ```iPad4,4```
iPad Mini Retina CDMA  | ```ipad_MINI_RETINA_WIFI_CDMA``` | ```iPad4,5```
iPad Mini Retina Cellular CN  | ```ipad_MINI_RETINA_WIFI_CELLULAR_CN``` | ```iPad4,6```
iPad Mini 3  | ```ipad_MINI_3_WIFI``` | ```iPad4,7```
iPad Mini 3 Cellular  | ```ipad_MINI_3_WIFI_CELLULAR``` | ```iPad4,8```
iPad Mini 4  | ```ipad_MINI_4_WIFI``` | ```iPad5.1```
iPad Mini 4 Cellular  | ```ipad_MINI_4_WIFI_CELLULAR``` | ```iPad5.2```
iPad Air 2  | ```ipad_AIR_2_WIFI``` | ```iPad5.3```
iPad Pro 9.7 Wifi Only  | ```ipad_PRO_97_WIFI``` | ```iPad6,3```
iPad Pro 9.7 Wifi + Cellular  | ```ipad_PRO_97_WIFI_CELLULAR``` | ```iPad6,4```
iPad Pro  | ```ipad_PRO_WIFI``` | ```iPad6,7```
iPad Pro Cellular  | ```ipad_PRO_WIFI_CELLULAR``` | ```iPad6,8```
9.7-inch iPad Wifi  | ```ipad_2017_WIFI``` | ```iPad6,11```
9.7-inch iPad Wifi + Cellular | ```ipad_2017_WIFI_CELLULAR``` | ```iPad6,12```
iPad Pro 12.9-Inch (Wi-Fi Only - 2nd Gen) | ```ipad_PRO_2G_WIFI``` | ```iPad7,1```
iPad Pro 12.9-Inch (Wi-Fi/Cell - 2nd Gen) | ```ipad_PRO_2G_WIFI_CELLULAR``` | ```iPad7,2```
iPad Pro 10.5-Inch (Wi-Fi Only) | ```ipad_PRO_105_WIFI``` | ```iPad7,3```
iPad Pro 10.5-Inch (Wi-Fi/Cellular) | ```ipad_PRO_105_WIFI_CELLULAR``` | ```iPad7,4```
iPad 9.7-Inch 6th Gen Wifi  | ```ipad_6_WIFI``` | ```iPad7,5```
iPad 9.7-Inch 6th Gen Wifi + Cellular | ```ipad_6_WIFI_CELLULAR``` | ```iPad7,6```

##### Apple TV
Device | hardware() | hardwareString()
--- | --- | ---
Apple TV 1G | ```appleTV_1G``` | ```appleTV1,1```
Apple TV 2G | ```appleTV_2G``` | ```appleTV2,1```
Apple TV 3G | ```appleTV_3G``` | ```appleTV3,1```
Apple TV 3G rev A | ```appleTV_3_2G``` | ```appleTV3,2```
Apple TV 4G | ```appleTV_4G``` | ```appleTV5,3```

##### Apple Watch
Device | hardware() | hardwareString()
--- | --- | ---
Apple Watch (38 mm) | ```appleWatch_38``` | ```Watch1,1```
Apple Watch (42 mm) | ```appleWatch_42``` | ```Watch1,2```
Apple Watch Series 2 (38 mm) | ```appleWatch_SERIES_2_38``` | ```Watch2,3```
Apple Watch Series 2 (42 mm) | ```appleWatch_SERIES_2_42``` | ```Watch2,4```
Apple Watch Series 1 (38 mm) | ```appleWatch_SERIES_1_38``` | ```Watch2,6```
Apple Watch Series 1 (42 mm) | ```appleWatch_SERIES_1_42``` | ```Watch2,7```
Apple Watch Series 3 Cellular (38 mm) | ```appleWatch_SERIES_3_38_CELLULAR``` | ```Watch3,1```
Apple Watch Series 3 Cellular (42 mm) | ```appleWatch_SERIES_3_42_CELLULAR``` | ```Watch3,2```
Apple Watch Series 3 (38 mm) | ```appleWatch_SERIES_3_38``` | ```Watch3,3```
Apple Watch Series 3 (42 mm) | ```appleWatch_SERIES_3_42``` | ```Watch3,4```
Apple Watch Series 4 (40 mm) | ```appleWatch_SERIES_4_40``` | ```Watch4,1```
Apple Watch Series 4 (44 mm) | ```appleWatch_SERIES_4_44``` | ```Watch4,2```
Apple Watch Series 4 Cellular (40 mm) | ```appleWatch_SERIES_4_40_CELLULAR``` | ```Watch4,3```
Apple Watch Series 4 Cellular (44 mm) | ```appleWatch_SERIES_4_44_CELLULAR``` | ```Watch4,4```



### Development

Want to contribute? Great!

Send the pull request :)


### License
MIT


