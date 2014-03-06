Pod::Spec.new do |s|

  s.name         = "KZNPopViewController"
  s.version      = "0.1"
  s.summary      = "Category of UIViewController to make popup UI."
  s.description  = <<-DESC
                   A longer description of KZNPopViewController in Markdown format.

                   * Category of UIViewController to make popup UI.
                   * KZNPopViewController is tested on iOS 5.0+ and requires ARC.
                   * Simple APIs which are like those in the UIViewController class.
                   * You're able to customize the popuped UIViewController design by yourself.
                   * You're able to choose one from some animations.
                   DESC
  s.homepage     = "http://kenzan8000.org"
  s.license      = { :type => 'MIT' }
  s.author       = { "Kenzan Hase" => "kenzan8000@gmail.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/kenzan8000/KZNPopViewController.git", :tag => "v0.1" }
  s.source_files  = 'KZNPopViewController/*.{h,m}'
  # s.exclude_files = 'Classes/Exclude'
  # s.public_header_files = 'Classes/**/*.h'
end
