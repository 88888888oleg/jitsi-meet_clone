# Pod::Spec.new do |s|
#   s.name             = 'jitsi_meet_flutter_sdk'
#   s.version          = '11.1.1'
#   s.summary          = 'Jitsi Meet Flutter SDK'
#   s.description      = 'Jitsi Meet Flutter SDK — JitsiMeetSDK'
#   s.homepage         = 'https://github.com/88888888oleg/jitsi-meet-flutter-sdk'
#   s.license          = { :file => '../LICENSE' }
#   s.author           = { 'Your Company' => 'email@example.com' }
#   s.source           = { :path => '.' }
#   s.source_files     = 'Classes/**/*'
#   s.dependency       'Flutter'
#   s.dependency       'JitsiMeetSDK'
#   s.platform         = :ios, '15.0'
#
#   s.pod_target_xcconfig = {
#     'DEFINES_MODULE' => 'YES',
#     'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
#   }
#   s.swift_version = '5.0'
# end

Pod::Spec.new do |s|
  s.name             = 'JitsiMeetSDK'
  s.version          = '1.0.0'
  s.summary          = 'Jitsi Meet iOS SDK'
  s.description      = 'Custom build of Jitsi Meet SDK'
  s.homepage         = 'https://github.com/88888888oleg/jitsi-meet'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'You' => 'you@example.com' }
  s.source           = { :path => '.' }

  s.platform         = :ios, '13.0'
  s.requires_arc     = true
  s.swift_version    = '5.0'

  s.vendored_frameworks = 'sdk/Frameworks/JitsiMeetSDK.xcframework'
  s.dependency 'WebRTC'
end