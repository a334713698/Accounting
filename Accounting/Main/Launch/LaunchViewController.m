//
//  LaunchViewController.m
//  project
//
//  Created by Alex on 2016/11/19.
//  Copyright © 2016年 yuanzhoulv. All rights reserved.
//

#import "LaunchViewController.h"
#import "TabBarViewController.h"                // tabBar控制器类
#import "HDJAuthenticationViewController.h"//身份验证

#define kLaunchScreenImageCount 1

@interface LaunchViewController ()<UIScrollViewDelegate>{
    UIPageControl *_pageControl;
    BOOL _requestSuccess;
}


@end

@implementation LaunchViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化子视图
    [self initSubviews];
}

#pragma mark - init Method
- (void)initSubviews {
    if (![[USER_DEFAULT objectForKey:IS_FIRSTOPEN] boolValue]) {
        // 是第一次进入
        [self appActiveByFirst];
    } else {
        // 不是第一次进入
        [self appActiveByNotFirst];
    }
}

- (void)initTabBar {
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
    
//    //指纹识别界面
//    HDJAuthenticationViewController *authVC = [[HDJAuthenticationViewController alloc] init];
//    [UIApplication sharedApplication].keyWindow.rootViewController = authVC;

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.width;
}

#pragma mark - SET Method
/**
 第一次进入应用实现方法
 */
- (void)appActiveByFirst {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(scrollView.width * kLaunchScreenImageCount, scrollView.height);
    scrollView.alwaysBounceHorizontal = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    for (NSInteger i = 0; i < kLaunchScreenImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * scrollView.width, 0, scrollView.width, scrollView.height)];
        [scrollView addSubview:imageView];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"launchScreen%ld",i]];
        
        if (i == kLaunchScreenImageCount - 1) {
            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake(scrollView.width / 2 - 65, scrollView.height * .6 , 130, 45)];
            [scrollView addSubview:enterButton];
            [enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            enterButton.titleLabel.font = [UIFont systemFontOfSize:16];
            [enterButton setBackgroundColor:MAIN_COLOR];
            [enterButton.layer setMasksToBounds:YES];
            [enterButton.layer setCornerRadius:5.0f];
            [enterButton setTitle:@"开启" forState:UIControlStateNormal];
            [enterButton addTarget:self action:@selector(enterButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(scrollView.width / 2 - 65, scrollView.height * .8 , 130, 20)];
    [scrollView addSubview:_pageControl];
    _pageControl.hidesForSinglePage = YES;
    _pageControl.numberOfPages = kLaunchScreenImageCount;
    _pageControl.pageIndicatorTintColor = MAIN_COLOR;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.userInteractionEnabled = NO;
}

/**
 非第一次进入应用实现方法
 */
- (void)appActiveByNotFirst {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"launch_icon"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(150, 51));
        make.centerX.mas_offset(0);
        make.bottom.mas_offset(-45);
    }];
    [self performSelector:@selector(initTabBar) withObject:nil afterDelay:3.0];
}

/**
 进入应用按钮实现

 @param sender 按钮
 */
- (void)enterButtonClickAction:(UIButton *)sender {
    [USER_DEFAULT setObject:@1 forKey:IS_FIRSTOPEN];
    [USER_DEFAULT synchronize];
    [[DJDatabaseManager sharedDJDatabaseManager] initializeDB];
    // 进入应用主界面
    [self initTabBar];
}

@end
