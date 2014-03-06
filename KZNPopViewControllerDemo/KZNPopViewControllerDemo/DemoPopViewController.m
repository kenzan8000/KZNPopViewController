#import "DemoPopViewController.h"
#import "KZNPopViewController.h"
#import <QuartzCore/QuartzCore.h>


#pragma mark - DemoPopViewController
@implementation DemoPopViewController


#pragma mark - synthesize
@synthesize contentView;
@synthesize button;


#pragma mark - lifecycle
- (void)loadView
{
    [super loadView];

    self.contentView.layer.cornerRadius = 5;
    self.contentView.clipsToBounds = true;
}


#pragma mark - event listener
- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
    [self dismissKZNPopViewControllerWithCompletion:^ () {}];
}


@end
