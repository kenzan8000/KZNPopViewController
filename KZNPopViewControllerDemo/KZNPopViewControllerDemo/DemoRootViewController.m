#import "DemoRootViewController.h"
#import "DemoPopViewController.h"
#import "KZNPopViewController.h"


#pragma mark - DemoRootViewController
@implementation DemoRootViewController


#pragma mark - event listener
- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
    UIViewController *popViewController = [[DemoPopViewController alloc] initWithNibName:NSStringFromClass([DemoPopViewController class])
                                                                                  bundle:nil];
    [self presentKZNPopViewController:popViewController
                     presentAnimation:[KZNPopAnimation presentAnimationFadeInFromCenter]
                     dismissAnimation:[KZNPopAnimation dismissAnimationFadeOutToCenter]
                           completion:nil];
}


@end
