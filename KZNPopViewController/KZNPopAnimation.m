#import "KZNPopAnimation.h"


#pragma mark - KZNPopAnimation
@implementation KZNPopAnimation


#pragma mark - synthesize
@synthesize animationType;
@synthesize duration;


#pragma mark - class method
+ (KZNPopAnimation *)animationWithAnimationType:(KZNPopViewControllerAnimationType)type
                                       duration:(CGFloat)duration
{
    KZNPopAnimation *animation = [[KZNPopAnimation alloc] initWithAnimationType:type
                                                                       duration:duration];
    return animation;
}

+ (KZNPopAnimation *)presentAnimationFadeIn
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeIn
                                              duration:0.3f];
}

+ (KZNPopAnimation *)presentAnimationFadeInFromCenter
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeIn | KZNPopViewControllerAnimationTypeScalingFromCenter
                                              duration:0.3f];
}

+ (KZNPopAnimation *)presentAnimationFadeInFromOutside
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeIn | KZNPopViewControllerAnimationTypeScalingFromOutside
                                              duration:0.3f];
}

+ (KZNPopAnimation *)dismissAnimationFadeOut
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeOut
                                              duration:0.3f];
}
+ (KZNPopAnimation *)dismissAnimationFadeOutToCenter
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeOut | KZNPopViewControllerAnimationTypeScalingToCenter
                                              duration:0.3f];
}

+ (KZNPopAnimation *)dismissAnimationFadeOutToOutside
{
    return [KZNPopAnimation animationWithAnimationType:KZNPopViewControllerAnimationTypeFadeOut | KZNPopViewControllerAnimationTypeScalingToOutside
                                              duration:0.3f];
}


#pragma mark - initializer
- (id)init
{
    self = [self initWithAnimationType:KZNPopViewControllerAnimationTypeNone
                              duration:0.0f];
    if (self) {
    }
    return self;
}

- (id)initWithAnimationType:(KZNPopViewControllerAnimationType)type
                   duration:(CGFloat)d
{
    self = [super init];
    if (self) {
        self.animationType = type;
        self.duration = d;
    }
    return self;

}


@end
