//
//  BaseNavigationController.m
//  mall
//
//  Created by irene on 16/3/8.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航栏效果
    [self setProperty];
    
}

#pragma mark - 设置导航栏效果
- (void)setProperty {
    // 取消导航栏的透明效果
    self.navigationBar.translucent = NO;
}

#pragma mark - 设置导航栏的样式
//设置导航栏的样式 ,只有在导航控制器中重写此方法,才能更改状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    //让子控制器控制状态栏的颜色
//    UIStatusBarStyle style =[self.topViewController preferredStatusBarStyle];
//    return style; //白色,默认是黑色
    // 统一为白色
    return UIStatusBarStyleLightContent;
}

@end
