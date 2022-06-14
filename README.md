

## Please use [DeviceGuru Library](https://github.com/InderKumarRathore/DeviceGuru), it is its swift version and also has some extra feature. This swift repo can be used in Objective-C projects



##### If you still want to use Objective C lib then please expect some delays in version roll out. And you might need to raise PRs to update this repo. I'm dividing my focus on both libs and not doing justice with both of them. I just want to focus on swift library going forward in 2022.

*DeviceUtil* helps identifying the exact harware type of the device. e.g. iPhone 6 or iPhone 6s.


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



