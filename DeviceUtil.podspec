

Pod::Spec.new do |spec|
  spec.name                = "DeviceUtil"
  spec.version             = "1.3.2"
  spec.summary             = "DeviceUtil helps identifying the exact harware type of the device. e.g. iPhone 6 or iPhone 6s."
  spec.homepage            = "https://github.com/InderKumarRathore/DeviceUtil.git"
  spec.license             = { :type => "MIT", :file => "LICENSE.txt" }
  spec.author              = { "Inder Kumar Rathore" => "contact.mr.rathore@gmail.com" }
  spec.social_media_url    = "https://twitter.com/InderKRathore"
  spec.source              = { :git => "https://github.com/InderKumarRathore/UIDeviceUtil.git", :tag => s.version }
  spec.source_files        = "*.{h,m}"
  spec.resource_bundles    = {'DeviceUtil' => ['DeviceList.plist']}
  spec.platform            = :ios, "5.0"
  spec.requires_arc        = false
end
