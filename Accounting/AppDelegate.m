//
//  AppDelegate.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "LaunchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    self.window = window;
    
//    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
//    self.window.rootViewController = tabBarVC;
    
    LaunchViewController *launchScreen = [[LaunchViewController alloc] init];
    self.window.rootViewController = launchScreen;
    
    [self.window makeKeyAndVisible];
    
    [self setup3DTouch:application];
    
    return YES;
}

- (void)setup3DTouch:(UIApplication *)application
{
    /**
     type 该item 唯一标识符
     localizedTitle ：标题
     localizedSubtitle：副标题
     icon：icon图标 可以使用系统类型 也可以使用自定义的图片
     userInfo：用户信息字典 自定义参数，完成具体功能需求
     */
    //    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"标签.png"];
    UIApplicationShortcutIcon *expendIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    UIApplicationShortcutItem *expendItem = [[UIApplicationShortcutItem alloc] initWithType:@"expend" localizedTitle:@"支出" localizedSubtitle:@"" icon:expendIcon userInfo:nil];
    
    /** 将items 添加到app图标 */
    application.shortcutItems = @[expendItem];
}


-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if([shortcutItem.type isEqualToString:@"expend"]){
        DLog(@"3DTouch-支出");
//        id rootVC = application.keyWindow.rootViewController;
//        if ([rootVC isMemberOfClass:[TabBarViewController class]]) {
//            [((TabBarViewController*)rootVC) enterHDJAddRecordViewController];
//        }else{
//            TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
//            application.keyWindow.rootViewController = tabBarVC;
//            [tabBarVC enterHDJAddRecordViewController];
//        }

    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
