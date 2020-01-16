Pod::Spec.new do |s|
  s.name         = 'JHTextKit'
  s.version      = '1.0.0'
  s.summary      = 'Text Limit.'
  s.description  = <<-DESC
  this pod is try to limit the String
                   DESC

  s.homepage     = 'https://github.com/RookiePyl/JHTextKit'
  s.license      = 'MIT'
  s.author       = { 'Rookie-Red' => 'xxygoodnight@gmail.com' }
  s.source       = { :git => 'https://github.com/RookiePyl/JHTextKit.git', :tag => s.version, :submodules => true }
  s.requires_arc  = true

  s.public_header_files = 'JHTextKit/JHTextKit.h'
  s.source_files  = 'JHTextKit/JHTextKit.h'
  s.platform     = :ios
  s.ios.deployment_target = '9.0'


end
