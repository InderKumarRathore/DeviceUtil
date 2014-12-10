

Pod::Spec.new do |s|
  s.name         = "UIDeviceUtil"
  s.version      = "0.0.1"
  s.summary      = "This category helps to check the hardware version of the device in iOS."
  s.homepage     = "http://device-version-ios.blogspot.in/"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author             = { "Inder Kumar Rathore" => "contact.mr.rathore@gmail.com" }
  s.social_media_url   = "http://facebook.com/InderKumarRathore"
  s.source       = { :git => "https://github.com/InderKumarRathore/UIDeviceUtil.git", :tag => "1.0.0" }
  s.source_files  = "*.{h,m}"
  s.platform = :ios
end

