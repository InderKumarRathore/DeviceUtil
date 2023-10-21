Pod::Spec.new do |s|
s.name             = "DeviceUtil"
s.version          = "6.2.0"
s.summary          = "DeviceUtil helps identifying the exact hardware type of the device. e.g. iPhone 6 or iPhone 6s."
s.homepage         = "https://github.com/InderKumarRathore/DeviceUtil.git"
s.license          = { :type => "MIT", :file => "LICENSE.txt" }
s.author           = { "Inder Kumar Rathore" => "" }
  s.social_media_url    = "https://twitter.com/ikr_303"
s.source           = { :git => "https://github.com/InderKumarRathore/DeviceUtil.git", :tag => s.version }
s.source_files     = "Source/*.{h,m}"
s.resource_bundles = {s.name => ['Source/DeviceList.plist']}
s.requires_arc     = false
s.ios.deployment_target = '12.0'
s.tvos.deployment_target = '12.0'
s.watchos.deployment_target = '4.0'
end
