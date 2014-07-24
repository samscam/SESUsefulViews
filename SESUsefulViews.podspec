Pod::Spec.new do |s|
  s.name             = "SESUsefulViews"
  s.version          = "0.1.2"
  s.summary          = "Two useful UIView subclasses!"
  s.description      = <<-DESC
                       It's two useful views which I find myself using in many projects:
                       
                       * SESCircularImageView is a UIImageView subclass with a circular mask and optional border
                       * SESGradientView is a UIView with a CAGradientLayer in it
                       
                       You can instantiate them programatically OR in interfacebuilder by changing the class name of a UIImageView or UIView respectively...
                       In interfacebuilder you can also set values for the exposed properties of the views like the colours or border width...
                       
                       Both should animate nicely in response to frame or property changes...

                       DESC
  s.homepage         = "https://github.com/samscam/SESUsefulViews"
  s.license          = 'MIT'
  s.author           = { "Sam Easterby-Smith" => "me@samscam.co.uk" }
  s.source           = { :git => "https://github.com/samscam/SESUsefulViews.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/samscam'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

end
