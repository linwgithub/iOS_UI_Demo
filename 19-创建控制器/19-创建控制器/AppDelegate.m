//
//  AppDelegate.m
//  19-创建控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "AppDelegate.h"
#import "WithXibViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建窗口
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //1、获取Storyboard
    UIStoryboard *mainStryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //2.1、获取箭头所指的控制器
    //id vc = [mainStryBoard instantiateInitialViewController];
    
    //2.2、根据标识获取控制器
    //根据设置的identify中storyboard ID来获取
    //id vc = [mainStryBoard instantiateViewControllerWithIdentifier:@"secend"];
    
    //2.3、直接创建控制器
    //UIViewController *vc = [[UIViewController alloc]init];
    //vc.view.backgroundColor = [UIColor grayColor];
    
    //2.4.1、指定xib创建控制器
    //WithXibViewController *vc = [[WithXibViewController alloc]initWithNibName:@"WithXibViewController" bundle:nil];
    
    //2.4.2、不指定xib创建控制器
    //加载xib的顺序：
    //在没有指定xib文件名时控制器先查找没有Controller后缀同名的xib文件，
    //查找不到时在查找同名的xib文件
    //PS：xib文件要能被查找到必须先在xib文件的属性界面中中指定class为目标控制器。
    WithXibViewController *vc = [[WithXibViewController alloc]init];
    
    //3、设置根控制器
    window.rootViewController = vc;
    
    //4、设为主窗口并可见
    [window makeKeyAndVisible];
    self.window = window;
    
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
