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



### Development

Want to contribute? Great!
Just update the `GeneratorDevice.plist`

Then
```sh
cd Generator
./main.swift
```
The above command will auto generate the required code

Send the pull request 🚀


### License
MIT



