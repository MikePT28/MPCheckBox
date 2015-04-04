Pod::Spec.new do |s|
  s.name             = "MPCheckBox"
  s.version          = "0.1"
  s.summary          = "Custom Check Boxes class."
  
  s.homepage         = "https://github.com/MikePT28/MPCheckBox"
  # s.screenshots     = "https://raw.githubusercontent.com/MikePT28/MPCheckBox/master/Images/image.png"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "MikePT28" => "mpesate@hotmail.com" }
  s.source           = { :git => "https://github.com/MikePT28/MPCheckBox.git", :tag => "0.1" }
  # s.social_media_url = 'https://twitter.com/MikePT28'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'MPCheckBox/*.{h,m}'
  s.requires_arc = true

end
