# Pod::Spec.new do |s|
#   s.name             = 'JitsiMeetSDK'
#   s.version          = '1.0.0'
#   s.summary          = 'Jitsi Meet iOS SDK'
#   s.description      = 'Custom fork of Jitsi Meet SDK for iOS'
#   s.homepage         = 'https://github.com/88888888oleg/jitsi-meet'
#   s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
#   s.author           = { 'You' => 'you@example.com' }
#   s.source = { :path => '.' }
# #   s.source           = { :git => 'https://github.com/88888888oleg/jitsi-meet.git', :branch => 'mobile_branch' }
#
#   s.platform         = :ios, '13.0'
#   s.requires_arc     = true
#   s.swift_version    = '5.0'
#
#   s.source_files     = 'ios/sdk/src/**/*.{h,m,mm,swift}'
#   s.public_header_files = 'ios/sdk/src/**/*.h'
#   s.resource_bundles = {
#     'JitsiMeetSDKResources' => ['ios/sdk/src/**/*.xcassets']
#   }
#
#   s.frameworks = ['UIKit', 'AVFoundation', 'WebKit']
#   s.vendored_frameworks = 'Frameworks/hermes.xcframework'
# end

Pod::Spec.new do |s|
  s.name             = 'JitsiMeetSDK'
  s.version          = '1.0.0'
  s.summary          = 'Jitsi Meet iOS SDK'
  s.description      = 'Custom fork of Jitsi Meet SDK for iOS'
  s.homepage         = 'https://github.com/88888888oleg/jitsi-meet'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'You' => 'you@example.com' }

  s.source           = { :path => '.' }
  s.platform         = :ios, '13.0'
  s.requires_arc     = true
  s.swift_version    = '5.0'

  s.source_files     = 'ios/sdk/src/**/*.{h,m,mm,swift}'
  s.public_header_files = 'ios/sdk/src/**/*.h'

  s.frameworks = ['UIKit', 'AVFoundation', 'WebKit']
  s.vendored_frameworks = 'Frameworks/hermes.xcframework'
  s.libraries = 'c++', 'resolv'
  s.dependency 'React-Core'
end