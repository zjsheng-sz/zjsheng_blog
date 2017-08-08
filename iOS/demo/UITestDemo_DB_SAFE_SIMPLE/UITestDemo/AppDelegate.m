//
//  AppDelegate.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"

#import "UserModel.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _userArr = [NSMutableArray array];
    
    ViewController1 * ctl1 = [[ViewController1 alloc] init];
    ViewController2 * ctl2 = [[ViewController2 alloc] init];
    ViewController3 * ctl3 = [[ViewController3 alloc] init];
    ViewController4 * ctl4 = [[ViewController4 alloc] init];
    ViewController5 * ctl5 = [[ViewController5 alloc] init];

    // 强制调用ViewController的viewDidLoad

    
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:ctl1];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:ctl2];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:ctl3];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:ctl4];
    UINavigationController * nav5 = [[UINavigationController alloc] initWithRootViewController:ctl5];
    
    UITabBarController * tabBarCtl = [[UITabBarController alloc] init];
    tabBarCtl.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    
    
    
    
    self.window.rootViewController = tabBarCtl;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
