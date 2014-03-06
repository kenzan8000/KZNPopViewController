#import "UIViewController+KZNPopViewController.h"
#import "KZNPopAnimation.h"
#import "KZNPopViewControllerManager.h"


#pragma mark - UIViewController+KZNPopViewController
@implementation UIViewController (KZNPopViewController)


#pragma mark - api
- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnimation
                   dismissAnimation:(KZNPopAnimation *)dismissAnimation
                         completion:(void (^)(void))completion
{
    [self presentKZNPopViewController:viewController
                     presentAnimation:presentAnimation
                     dismissAnimation:dismissAnimation
                      backgroundColor:[UIColor clearColor]
                           completion:completion];

}

- (void)presentKZNPopViewController:(UIViewController *)viewController
                   presentAnimation:(KZNPopAnimation *)presentAnimation
                   dismissAnimation:(KZNPopAnimation *)dismissAnimation
                    backgroundColor:(UIColor *)backgroundColor
                         completion:(void (^)(void))completion
{
    [[KZNPopViewControllerManager sharedInstance] presentKZNPopViewController:viewController
                                                             presentAnimation:presentAnimation
                                                             dismissAnimation:dismissAnimation
                                                              backgroundColor:backgroundColor
                                                                   completion:completion];
}

- (void)dismissKZNPopViewControllerWithCompletion:(void (^)(void))completion
{
    [[KZNPopViewControllerManager sharedInstance] dismissKZNPopViewControllerWithCompletion:completion];
}


@end
