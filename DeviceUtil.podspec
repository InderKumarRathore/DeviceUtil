

Pod::Spec.new do |s|
  s.name                = "DeviceUtil"
  s.version             = "1.3.0"
  s.summary             = "DeviceUtil helps identifying the exact harware type of the device. e.g. iPhone 6 or iPhone 6s."
  s.homepage            = "https://github.com/InderKumarRathore/DeviceUtil.git"
  s.license             = { :type => "MIT", :file => "LICENSE.txt" }
  s.author              = { "Inder Kumar Rathore" => "contact.mr.rathore@gmail.com" }
  s.social_media_url    = "https://twitter.com/InderKRathore"
  s.source              = { :git => "https://github.com/InderKumarRathore/UIDeviceUtil.git", :tag => s.version }
  s.source_files        = "*.{h,m}"
  s.resource_bundles    = {'DeviceUtil' => ['DeviceList.plist']}
  s.platform            = :ios, "5.0"
  s.requires_arc        = false
end
