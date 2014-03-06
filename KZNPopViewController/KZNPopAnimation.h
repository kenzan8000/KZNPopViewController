#pragma mark - constant
/// animation settings
typedef NS_ENUM(NSInteger, KZNPopViewControllerAnimationType) {
    KZNPopViewControllerAnimationTypeNone                   = 0x0000,

    KZNPopViewControllerAnimationTypeFadeIn                 = 0x0010,
    KZNPopViewControllerAnimationTypeFadeOut                = 0x0020,

    KZNPopViewControllerAnimationTypeScalingFromCenter      = 0x0100,
    KZNPopViewControllerAnimationTypeScalingFromOutside     = 0x0200,

    KZNPopViewControllerAnimationTypeScalingToCenter        = 0x1000,
    KZNPopViewControllerAnimationTypeScalingToOutside       = 0x2000,
};


#pragma mark - KZNPopAnimation
@interface KZNPopAnimation : NSObject {
}


#pragma mark - property
/// animation type
@property (nonatomic, assign) KZNPopViewControllerAnimationType animationType;
/// animation duration
@property (nonatomic, assign) CGFloat duration;


#pragma mark - class method
+ (KZNPopAnimation *)animationWithAnimationType:(KZNPopViewControllerAnimationType)type
                                       duration:(CGFloat)duration;

+ (KZNPopAnimation *)presentAnimationFadeIn;
+ (KZNPopAnimation *)presentAnimationFadeInFromCenter;
+ (KZNPopAnimation *)presentAnimationFadeInFromOutside;
+ (KZNPopAnimation *)dismissAnimationFadeOut;
+ (KZNPopAnimation *)dismissAnimationFadeOutToCenter;
+ (KZNPopAnimation *)dismissAnimationFadeOutToOutside;


#pragma mark - initializer
- (id)initWithAnimationType:(KZNPopViewControllerAnimationType)type
                   duration:(CGFloat)duration;


@end
