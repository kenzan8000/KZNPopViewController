#pragma mark - class
@class KZNPopAnimation;
@class KZNOverlayWindow;


#pragma mark - KZNPopViewControllerManager
@interface KZNPopViewControllerManager : NSObject {
}


#pragma mark - property


#pragma mark - class method
+ (KZNPopViewControllerManager *)sharedInstance;


#pragma mark - api
- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnimation
                   dismissAnimation:(KZNPopAnimation *)dismissAnimation
                    backgroundColor:(UIColor *)backgroundColor
                         completion:(void (^)(void))completion;

- (void)dismissKZNPopViewControllerWithCompletion:(void (^)(void))completion;


@end
