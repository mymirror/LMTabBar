#
#  Be sure to run `pod spec lint LMTabBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "LMTabBar"
  spec.version      = "0.0.3"
  spec.summary      = "A custom of LMTabBar."

  
  spec.description  = <<-DESC
                   custom Tabbar with custom title or image
                   DESC

  spec.homepage     = "https://github.com/mymirror/LMTabBar"


 
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "mirror" => "852171945@qq.com" }

  spec.platform     = :ios, "8.0"


  spec.source       = { :git => "https://github.com/mymirror/LMTabBar.git", :tag => "#{spec.version}" }

  spec.source_files  = "LMTabBar/LMTabBar/*.{h,m}"

  spec.requires_arc = true

  spec.dependency "LMTools"

end
