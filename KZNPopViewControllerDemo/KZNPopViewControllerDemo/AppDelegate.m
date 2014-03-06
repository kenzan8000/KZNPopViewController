//
//  AppDelegate.m
//  KZNPopViewControllerDemo
//
//  Created by Kenzan Hase on 3/2/14.
//  Copyright (c) 2014 Kenzan Hase. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"KZNPopViewControllerDemo"
                                                         bundle:nil];
    [self.window setRootViewController:[storyboard instantiateInitialViewController]];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}


@end
