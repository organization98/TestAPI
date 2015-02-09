//
//  AppDelegate.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+ConvertHEX.h"

// Base colors
#define GlobalOceanGreenColor [UIColor colorWithHexString:@"#4BB179"] // base green
#define GlobalWhiteColor [UIColor colorWithHexString:@"#FFFFFF"]
#define SorbusColor [UIColor colorWithHexString:@"#F2854C"] // orange
#define HintOfRedColor [UIColor colorWithHexString:@"#FAFAFA"] // base gray

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // инфо: http://www.appcoda.com/customize-navigation-status-bar-ios-7/
    
    // изменение цвета NavigationBar и цвета шрифта кнопок
    [[UINavigationBar appearance] setBarTintColor:GlobalOceanGreenColor];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                        GlobalWhiteColor, NSForegroundColorAttributeName, nil]];

    [[UINavigationBar appearance] setTintColor:GlobalWhiteColor];
    
    // изменение цвета Toolbar и цвета шрифта кнопок
    [[UIToolbar appearance] setBarTintColor:GlobalOceanGreenColor];
    [[UIToolbar appearance] setTintColor:GlobalWhiteColor];

//    // изменение стиля StatusBar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
