#
# Be sure to run `pod lib lint Tempo_ios_sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ScreenProtector'
  s.version          = '1.0.0'
  s.summary          = 'iOS library for protecter screen'
  s.description      = 'iOS library for protecter screen'
  s.homepage         = 'https://github.com/jmvictorio'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jesús Victorio' => 'jesusvicmar@gmail.com',  }
  s.source           = { :git => 'git@github.com:jmvictorio/ScreenProtector.git', :tag => s.version.to_s}

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Source/*.{swift}'

  s.libraries = 'z', 'c++'
  s.frameworks = 'Foundation', 'UIKit'

end
