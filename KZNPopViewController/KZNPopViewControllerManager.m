#import "KZNPopViewControllerManager.h"
#import "KZNPopAnimation.h"
#import "KZNOverlayWindow.h"


#pragma mark - KZNPopViewControllerManager
@interface KZNPopViewControllerManager ()


#pragma mark - property
/// managed ViewController
@property (nonatomic, strong) UIViewController *popViewController;
/// background view
@property (nonatomic, strong) UIView *backgroundView;
/// background window of popViewController.view and backgroundView
@property (nonatomic, strong) KZNOverlayWindow *backgroundWindow;

/// present animation
@property (nonatomic, strong) KZNPopAnimation *presentAnimation;
/// dismiss animation
@property (nonatomic, strong) KZNPopAnimation *dismissAnimation;


@end


#pragma mark - KZNPopViewControllerManager
@implementation KZNPopViewControllerManager


#pragma mark - synthesize
@synthesize popViewController;
@synthesize backgroundView;
@synthesize backgroundWindow;
@synthesize presentAnimation;
@synthesize dismissAnimation;



#pragma mark - class method
+ (KZNPopViewControllerManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    static KZNPopViewControllerManager *_KZNPopViewControllerManager = nil;
    dispatch_once(&onceToken, ^ () {
        _KZNPopViewControllerManager = [KZNPopViewControllerManager new];
    });
    return _KZNPopViewControllerManager;
}


#pragma mark - release
- (void)dealloc
{
    self.popViewController = nil;
    self.backgroundView = nil;
    self.backgroundWindow = nil;
    self.presentAnimation = nil;
    self.dismissAnimation = nil;
}


#pragma mark - api
- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnim
                   dismissAnimation:(KZNPopAnimation *)dismissAnim
                    backgroundColor:(UIColor *)backgroundColor
                         completion:(void (^)(void))completion
{
    self.presentAnimation = presentAnim;
    self.dismissAnimation = dismissAnim;
    self.backgroundWindow = [KZNOverlayWindow new];
    [self.backgroundWindow makeKeyAndVisible];

    // background
    self.backgroundView = [[UIView alloc] initWithFrame:self.backgroundWindow.frame];
    [self.backgroundView setBackgroundColor:backgroundColor];
    [self.backgroundView setAlpha:0];
    [self.backgroundWindow addSubview:self.backgroundView];
    // popViewController
    self.popViewController = viewController;
    [self.backgroundWindow addSubview:self.popViewController.view];
    //
    [self prepareAnimationWithAnimation:self.presentAnimation];

    // animation
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:self.presentAnimation.duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        [weakSelf.backgroundView setAlpha:1.0f];
        [weakSelf animateWithAnimation:weakSelf.presentAnimation];
    }
                     completion:^ (BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^ () {
            if (completion) { completion(); }
            weakSelf.popViewController.view.alpha = 1.0f;
        });
    }];
}

- (void)dismissKZNPopViewControllerWithCompletion:(void (^)(void))completion

{
    // background
    [self.backgroundView setAlpha:1.0f];

    [self prepareAnimationWithAnimation:self.dismissAnimation];

    // animation
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:self.dismissAnimation.duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        [weakSelf.backgroundView setAlpha:0.0f];
        [weakSelf animateWithAnimation:weakSelf.dismissAnimation];
    }
                     completion:^ (BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^ () {
            if (completion) { completion(); }
            [weakSelf.backgroundView removeFromSuperview];
            [weakSelf.backgroundView.window resignKeyWindow];
            weakSelf.backgroundView = nil;
            [weakSelf.popViewController.view removeFromSuperview];
            [weakSelf.popViewController.view.window resignKeyWindow];
            weakSelf.popViewController.view = nil;
            weakSelf.backgroundWindow = nil;
        });
    }];

}


#pragma mark - private api
- (void)prepareAnimationWithAnimation:(KZNPopAnimation *)animation
{
    KZNPopViewControllerAnimationType animationType = animation.animationType;
    CGAffineTransform transform = CGAffineTransformIdentity;

    if (animationType & KZNPopViewControllerAnimationTypeFadeIn) {
        self.popViewController.view.alpha = 0.0f;
    }
    else if (animationType & KZNPopViewControllerAnimationTypeFadeOut) {
        self.popViewController.view.alpha = 1.0f;
    }

    if (animationType & KZNPopViewControllerAnimationTypeScalingFromCenter) {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(0.0f, 0.0f));
    }
    else if (animationType & KZNPopViewControllerAnimationTypeScalingFromOutside) {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(2.0f, 2.0f));
    }
    else {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(1.0f, 1.0f));
    }
    self.popViewController.view.transform = transform;
}

- (void)animateWithAnimation:(KZNPopAnimation *)animation
{
    KZNPopViewControllerAnimationType animationType = animation.animationType;
    CGAffineTransform transform = CGAffineTransformIdentity;

    if (animationType & KZNPopViewControllerAnimationTypeFadeIn) {
        self.popViewController.view.alpha = 1.0f;
    }
    else if (animationType & KZNPopViewControllerAnimationTypeFadeOut) {
        self.popViewController.view.alpha = 0.0f;
    }

    if (animationType & KZNPopViewControllerAnimationTypeScalingToCenter) {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(0.0f, 0.0f));
    }
    else if (animationType & KZNPopViewControllerAnimationTypeScalingToOutside) {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(2.0f, 2.0f));
    }
    else {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(1.0f, 1.0f));
    }
    self.popViewController.view.transform = transform;
}


@end
