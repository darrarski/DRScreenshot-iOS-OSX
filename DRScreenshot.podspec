Pod::Spec.new do |s|
  s.name         = "DRScreenshot"
  s.version      = "0.1"
  s.summary      = ""
  s.homepage     = "http://bitbucket.org/darrarski/drscreenshot-ios-osx"
  s.license      = 'MIT'
  s.author       = { "Darrarski" => "darrarski@gmail.com" }
  s.source       = { :git => "http://bitbucket.org/darrarski/drscreenshot-ios-osx.git" }
  s.osx.source_files = 'DRScreenshot-OSX'
  s.requires_arc = true
end
