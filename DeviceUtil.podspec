Pod::Spec.new do |s|
s.name             = "DeviceUtil"
s.version          = "2.1.2"
s.summary          = "DeviceUtil helps identifying the exact harware type of the device. e.g. iPhone 6 or iPhone 6s."
s.homepage         = "https://github.com/InderKumarRathore/DeviceUtil.git"
s.license          = { :type => "MIT", :file => "LICENSE.txt" }
s.author           = { "Inder Kumar Rathore" => "contact.mr.rathore@gmail.com" }
  s.social_media_url    = "https://twitter.com/ikr_303"
s.source           = { :git => "https://github.com/InderKumarRathore/DeviceUtil.git", :tag => s.version }
s.source_files     = "*.{h,m}"
s.resource_bundles = {s.name => ['DeviceList.plist']}
s.requires_arc     = false
s.ios.deployment_target = '7.0'
s.tvos.deployment_target = '9.0'
end
