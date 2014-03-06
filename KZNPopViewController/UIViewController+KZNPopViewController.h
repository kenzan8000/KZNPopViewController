#pragma mark - class
@class KZNPopAnimation;


#pragma mark - interface
@interface UIViewController (KZNPopViewController)


#pragma mark - api
- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnimation
                   dismissAnimation:(KZNPopAnimation *)dismissAnimation
                         completion:(void (^)(void))completion;

- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnimation
                   dismissAnimation:(KZNPopAnimation *)dismissAnimation
                    backgroundColor:(UIColor *)backgroundColor
                         completion:(void (^)(void))completion;

- (void)dismissKZNPopViewControllerWithCompletion:(void (^)(void))completion;


@end
