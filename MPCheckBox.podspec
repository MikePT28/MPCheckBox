#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MPCheckBox"
  s.version          = "0.1"
  s.summary          = "Custom Check Boxes class."
  s.description      = <<-DESC
                       An optional longer description of ${POD_NAME}

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/MikePT28/MPCheckBox"
  # s.screenshots     = "https://raw.githubusercontent.com/MikePT28/MPCheckBox/master/Images/image.png"
  s.license          = 'MIT'
  s.author           = { "MikePT28" => "mpesate@hotmail.com" }
  s.source           = { :git => "https://github.com/MikePT28/MPCheckBox.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/MikePT28'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    '${POD_NAME}' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
