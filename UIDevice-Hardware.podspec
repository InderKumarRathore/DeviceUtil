Pod::Spec.new do |s|
  s.name     = 'UIDevice-Hardware'
  s.version  = '1.0.0'
  s.license  = { :type => "MIT", :file => "License.txt" }
  s.summary  = 'This category helps to check the hardware version of the device in iOS.'
  s.homepage = 'https://github.com/InderKumarRathore/UIDevice-Hardware'
  s.author   = 'Inder Kumar Rathore' 
  s.source   = { :git => 'https://github.com/InderKumarRathore/UIDevice-Hardware.git',
                 :tag => '1.0.0' }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true

  s.platform     = :ios
end