//
//  AppDelegate.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "AppDelegate.h"

// Base colors
#define GlobalOceanGreenColor [UIColor colorWithRed:0.31f green:0.69f blue:0.48f alpha:1.0f]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // инфо: http://www.appcoda.com/customize-navigation-status-bar-ios-7/
    
    // изменение цвета NavigationBar и цвета шрифта кнопок
    [[UINavigationBar appearance] setBarTintColor:GlobalOceanGreenColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, shadow, NSShadowAttributeName, [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    // изменение цвета Toolbar и цвета шрифта кнопок
    [[UIToolbar appearance] setBarTintColor:GlobalOceanGreenColor];
    [[UIToolbar appearance] setTintColor:[UIColor whiteColor]];
    [[UIToolbar appearance] setTranslucent:NO];
    
    // изменение стиля StatusBar
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
