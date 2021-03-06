#
# Be sure to run `pod lib lint CappsoftKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CappsoftKit'
  s.version          = '0.1.0'
  s.summary          = 'Collection of wrappers, utilities, and solutions used by me during iOS app development in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Collection of wrappers, utilities, and solutions used by me during iOS app development in Swift. This is still in development. The best way to use it right now is to add it as a development pod. 
                       DESC

  s.homepage         = 'https://github.com/kkapitan/CappsoftKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Krzysztof' => 'krzysztof.kapitan@gmail.com' }
  s.source           = { :git => 'https://github.com/kkapitan/CappsoftKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/panjerzyk'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CappsoftKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CappsoftKit' => ['CappsoftKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
