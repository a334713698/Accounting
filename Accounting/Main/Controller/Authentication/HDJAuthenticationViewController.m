//
//  HDJAuthenticationViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/12/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJAuthenticationViewController.h"
#import "TabBarViewController.h"                // tabBar控制器类
#import <LocalAuthentication/LocalAuthentication.h>

@interface HDJAuthenticationViewController ()

@end

@implementation HDJAuthenticationViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self useTouchID];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    //背景
    UIImageView* bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_pic"]];
    [self.view addSubview:bgImageView];
    bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //毛玻璃
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    visualView.frame = bgImageView.bounds;
    [self.view addSubview:visualView];
    
    UIButton* enterButton = [UIButton new];
    [self.view addSubview:enterButton];
    [enterButton setTitle:@"进入主界面" forState:UIControlStateNormal];
    [enterButton setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-adaptHeight(45));
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    enterButton.titleLabel.font = [UIFont boldSystemFontOfSize:adaptFont(15)];
    [enterButton addTarget:self action:@selector(enterMain) forControlEvents:UIControlEventTouchUpInside];
    enterButton.layer.cornerRadius = 5;
    enterButton.layer.masksToBounds = YES;
    
    UIButton* touchButton = [UIButton new];
    [self.view addSubview:touchButton];
    [touchButton setImage:[UIImage imageNamed:@"icon_touchid"] forState:UIControlStateNormal];
    [touchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-adaptHeight(55));
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(adaptWidth(65), adaptWidth(65)));
    }];
    [touchButton addTarget:self action:@selector(useTouchID) forControlEvents:UIControlEventTouchUpInside];

}

- (void)useTouchID{
    LAContext *context = [[LAContext alloc] init];
    // 当指纹识别失败一次后，弹框会多出一个选项，而这个属性就是用来设置那个选项的内容
    context.localizedFallbackTitle = @"";
    NSError *error = nil;
    
    WS(weakSelf)

    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) { // 该设备支持指纹识别
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"身份验证需要解锁指纹识别功能" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {  // 验证成功
                DLog(@"");
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [weakSelf enterMain];
                }];
            }else {
                
                NSLog(@"%@", error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                        NSLog(@"身份验证被系统取消（验证时当前APP被移至后台或者点击了home键导致验证退出时提示）");
                        break;
                    case LAErrorUserCancel:
                        NSLog(@"身份验证被用户取消（当用户点击取消按钮时提示）");
                        break;
                    case LAErrorAuthenticationFailed:
                        NSLog(@"身份验证没有成功，因为用户未能提供有效的凭据(连续3次验证失败时提示)");
                        break;
                    case LAErrorPasscodeNotSet:
                        NSLog(@"Touch ID无法启动，因为没有设置密码（当系统没有设置密码的时候，Touch ID也将不会开启）");
                        break;
                    case LAErrorTouchIDNotAvailable:
                        NSLog(@"无法启动身份验证");  // 这个没有检测到，应该是出现硬件损坏才会出现
                        break;
                    case LAErrorTouchIDNotEnrolled:
                        NSLog(@"无法启动身份验证，因为触摸标识没有注册的手指");  // 这个暂时没检测到
                        break;
                    case LAErrorUserFallback:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"用户选择其他验证方式，切换主线程处理");
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"其他情况，切换主线程处理");   // 5次失败进入,如果继续验证，则需要使用其他方式验证
                        }];
                        break;
                    }
                }
            }
        }
         ];
        
    }else {

        NSLog(@"不支持指纹识别");
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
                NSLog(@"设备Touch ID不可用");
                break;
            case LAErrorPasscodeNotSet:
                NSLog(@"系统未设置密码");
                break;
            default:
                NSLog(@"TouchID不可用或已损坏");
                break;
        }
        
        NSLog(@"%@", error.localizedDescription);
        
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"不支持指纹识别功能" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"进入主界面" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf enterMain];
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }

}

- (void)enterMain{
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
}

@end
