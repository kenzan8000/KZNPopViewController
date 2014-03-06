# KZNPopViewController
===============

![fadeInFromCenter](https://raw2.github.com/kenzan8000/KZNPopViewController/master/Screenshot/fadeInFromCenter.gif "fadeInFromCenter")

Category of UIViewController to make popup UI.

KZNPopViewController is tested on iOS 5.0+ and requires ARC.


## Features
* Simple APIs which are like those in the UIViewController class.
* You're able to customize the popuped UIViewController design by yourself.
* You're able to choose one from some animations.


## Installation

### CocoaPods
If you are using CocoaPods, then just add KZNPopViewController to you Podfile.
```ruby
pod 'KZNPopViewController', :git => 'https://github.com/kenzan8000/KZNPopViewController.git'
```

### Manually
Simply add the files in the KZNPopViewController directory to your project.


## Example

### Default Animation
```objective-c
    [self presentKZNPopViewController:viewController
                     presentAnimation:[KZNPopAnimation presentAnimationFadeInFromCenter]
                     dismissAnimation:[KZNPopAnimation dismissAnimationFadeOutToCenter]
                           completion:NULL];
```

### Custom Animation
```objective-c
    KZNPopAnimation *presentAnimation = [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeIn | KZNPopViewControllerAnimationTypeScalingFromOutside
                                                                           duration:0.3f];
    KZNPopAnimation *dismissAnimation = [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeOut
                                                                           duration:0.3f];

    [self presentKZNPopViewController:viewController
                     presentAnimation:presentAnimation
                     dismissAnimation:dismissAnimation
                      backgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]
                           completion:NULL];
```

## License
Released under the MIT license.
