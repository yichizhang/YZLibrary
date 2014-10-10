Pod::Spec.new do |s|
  s.name         = "YZLibrary"
  s.version      = "1.0.0"
  s.summary      = "A library of code that might help your iOS development."
  s.homepage     = "https://github.com/yichizhang/YZLibrary"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Yichi Zhang" => "zhang-yi-chi@hotmail.com" }
  s.source       = {
    :git => "https://github.com/yichizhang/YZLibrary.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'YZLibrary/*.{h,m}'
  #s.resources    = 'RES.bundle'

  s.framework  = 'Foundation', 'UIKit'

end