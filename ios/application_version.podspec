#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint application_version.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'application_version'
  s.version          = '0.0.1'
  s.summary          = 'Application version plugin project..'
  s.description      = <<-DESC
Application version plugin project..
                       DESC
  s.homepage         = 'https://github.com/kherel/application_version'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'kherel@kherel.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
