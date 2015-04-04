Pod::Spec.new do |s|

  s.name         = "MPCheckBox"
  s.version      = "0.1"
  s.summary      = "Customisable checkbox class for Objective-C"

  s.homepage     = "https://github.com/MikePT28/MPCheckBox"
  s.screenshots  = "https://raw.githubusercontent.com/MikePT28/MPCheckBox/master/Images/image.png"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "MikePT28" => "mpesate@hotmail.com" }
  
  s.social_media_url   = 'https://twitter.com/MikePT28'
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/MikePT28/MPCheckBox.git", :tag => "0.1" }

  s.source_files  = "MPCheckBox/*.{h,m}"
  s.requires_arc = true

end