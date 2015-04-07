
Pod::Spec.new do |spec|
  spec.name         = 'MPCheckBox'
  spec.version      = '0.1.3.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/MikePT28/MPCheckBox'
  spec.authors      = { 'MikePT28' => '' }
  spec.summary      = "Custom Check Boxes class."
  spec.source       = { :git => 'https://github.com/MikePT28/MPCheckBox.git', :tag => '0.1.3' }
  spec.source_files = 'MPCheckBox/*.{h,m}'
  spec.platform     = :ios, "8.0"
end
