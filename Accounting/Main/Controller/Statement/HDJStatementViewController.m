//
//  HDJStatementViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJStatementViewController.h"
#import "YZLStatementCateView.h"
#import "YZLStatementTrendView.h"
#import "HDJScrollerView.h"
#import "YZLStatementNavView.h"

@interface HDJStatementViewController ()<HDJScrollerViewDelegate, YZLStatementNavViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HDJScrollerView *statementScrollerView;
@property (nonatomic, strong) YZLStatementCateView *cateView;
@property (nonatomic, strong) YZLStatementTrendView *trendView;
@property (nonatomic, strong) YZLStatementNavView* navView;

@end

@implementation HDJStatementViewController


#pragma mark - lazy load
- (YZLStatementCateView *)cateView{
    if (!_cateView) {
        _cateView = [YZLStatementCateView new];
    }
    return _cateView;
}

- (YZLStatementTrendView *)trendView{
    if (!_trendView) {
        _trendView = [YZLStatementTrendView new];
    }
    return _trendView;
}

- (HDJScrollerView *)statementScrollerView{
    if (!_statementScrollerView) {
        _statementScrollerView = [[HDJScrollerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - TABBAR_HEIGHT) andSubviews:@[self.cateView,self.trendView]];
        _statementScrollerView.scrollerViewPageDelegate = self;
        _statementScrollerView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_statementScrollerView];
    }
    return _statementScrollerView;
}

- (YZLStatementNavView *)navView{
    if (!_navView) {
        _navView = [[YZLStatementNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height) andTitles:@[@"分类",@"趋势"]];
        _navView.delegate = self;
    }
    return _navView;
}

#pragma mark - view func
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self initNav];
    self.statementScrollerView.hidden = NO;
}

#pragma mark - HDJScrollerViewDelegate
- (void)scrollerView:(HDJScrollerView*)scrollerView currentPage:(NSInteger)pageIndex{
    DLog(@"%ld",pageIndex);
    self.navView.currentIndex = pageIndex;
}

#pragma mark - YZLStatementNavViewDelegate
- (void)titleView:(YZLStatementNavView*)navView btnDidClickWithIndex:(NSInteger)index{
    [self.statementScrollerView setPageIndex:index animated:YES];
}

#pragma mark - SEL


#pragma mark - Method
- (void)initNav{
//    self.navTitle = @"报表";
    self.navButtonLeft.hidden = YES;
    self.navButtonRight.hidden = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.view.backgroundColor = WHITE_COLOR;
    
    self.navigationItem.titleView = self.navView;
}


#pragma mark - NetRequest



@end
