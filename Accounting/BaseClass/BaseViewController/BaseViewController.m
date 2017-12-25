//
//  BaseViewController.m
//  mall
//
//  Created by irene on 16/3/8.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (DJDatabaseManager *)dbMgr{
    if (!_dbMgr) {
        _dbMgr = [DJDatabaseManager sharedDJDatabaseManager];
    }
    return _dbMgr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏
    [self initNavView];
}

- (void)initNavView {
    CGFloat navTitleFontSize = adaptFont(16.0f);
    
    // 导航栏左侧按钮
    _navButtonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    _navButtonLeft.frame = CGRectMake(0, 0, NavigationBarIcon, NAVIGATIONBAR_HEIGHT);
    _navButtonLeft.titleLabel.font = [UIFont systemFontOfSize:navTitleFontSize];
    [_navButtonLeft setImage:[UIImage imageNamed:@"nav_jiantou_zuo"] forState:UIControlStateNormal];
    _navButtonLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_navButtonLeft addTarget:self action:@selector(navLeftPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navButtonLeft];
    
    // 导航栏右侧按钮
    _navButtonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    _navButtonRight.frame = CGRectMake(0, 0, NAVIGATIONBAR_HEIGHT + 20, NAVIGATIONBAR_HEIGHT);
    _navButtonRight.titleLabel.font = [UIFont systemFontOfSize:navTitleFontSize];
    _navButtonRight.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_navButtonRight addTarget:self action:@selector(navRightPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navButtonRight];
    
    //    // 状态栏背景视图
    //    _statusBarBgView = [[UIView alloc] initWithFrame:CGRectMake(0, -STATUSBAR_HEIGHT, SCREEN_WIDTH, STATUSBAR_HEIGHT)];
    //    _statusBarBgView.backgroundColor = MAIN_COLOR;
    //    [self.navigationController.navigationBar addSubview:_statusBarBgView];
    
    // 导航栏背景色
    self.navigationController.navigationBar.barTintColor = MAIN_COLOR;
    
    // 设置导航栏字体颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
}

#pragma mark - setNavTitle Method
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    self.navigationItem.title = _navTitle;
}


#pragma mark - 按钮点击事件
/**
 *  导航左按钮事件（默认返回上一页）
 */
- (void)navLeftPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  导航右按钮事件（默认无内容）
 */
- (void)navRightPressed:(id)sender {
    DLog(@"=> navRightPressed !");
}


@end

