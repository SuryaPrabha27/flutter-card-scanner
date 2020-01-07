#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_card_scanner_latest.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_card_scanner_latest'
  s.version          = '0.0.1'
  s.summary          = 'Flutters Card Scanner Project'
  s.description      = <<-DESC
A flutter project for scanning the credit cards on an iOS device which returns a json response with the
  details like cardholders name and the expiry date of the card.
  For security reasons, we are not collecting CVV during the scan.
                       DESC
  s.homepage         = 'https://flutter.io/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.swift_version = '5.0'
  s.static_framework = true
  s.frameworks       = 'Accelerate', 'AVFoundation', 'AudioToolbox', 'CoreMedia', 'CoreVideo', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'Security', 'UIKit'
end
