//
//  HDJAddRecordViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJAddRecordViewController.h"
#import "HDJRecordView.h"
#import "HDJRecordScrollerView.h"
#import "HDJEditCategoryController.h"
#import "HDJCustomKeyBoardView.h"

@interface HDJAddRecordViewController ()<HDJRecordScrollerViewDelegate, HDJRecordViewDelegate, HDJRecordTopViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) HDJRecordScrollerView *recordScrollerView;
@property (nonatomic, strong) HDJRecordView* incomeRecordView;
@property (nonatomic, strong) HDJRecordView* expensesRecordView;

@property (nonatomic, strong) HDJCustomKeyBoardView *keyboardView;
@end

@implementation HDJAddRecordViewController

#pragma mark - lazy load
- (HDJCustomKeyBoardView *)keyboardView{
    if (!_keyboardView) {
        _keyboardView = [[HDJCustomKeyBoardView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, adaptHeight(CustomKeyBoard_Height))];
        [self.view addSubview:_keyboardView];
    }
    return _keyboardView;
}

- (HDJRecordView *)incomeRecordView{
    if (!_incomeRecordView) {
        _incomeRecordView = [HDJRecordView new];
        _incomeRecordView.type = 1;
        _incomeRecordView.delegate = self;
        _incomeRecordView.recordTopView.delegate = self;
        [self.view addSubview:_incomeRecordView];
    }
    return _incomeRecordView;
}

- (HDJRecordView *)expensesRecordView{
    if (!_expensesRecordView) {
        _expensesRecordView = [HDJRecordView new];
        _expensesRecordView.delegate = self;
        _expensesRecordView.type = 2;
        _expensesRecordView.recordTopView.delegate = self;
        [self.view addSubview:_expensesRecordView];
    }
    return _expensesRecordView;
}

- (HDJRecordScrollerView *)recordScrollerView{
    if (!_recordScrollerView) {
        _recordScrollerView = [[HDJRecordScrollerView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) andSubviews:@[self.incomeRecordView,self.expensesRecordView]];
        _recordScrollerView.recordScrollerViewPageDelegate = self;
        [self.view addSubview:_recordScrollerView];
    }
    return _recordScrollerView;
}

- (UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"  收入  ",@"  支出  "]];
        _segmentedControl.tintColor = WHITE_COLOR;
        _segmentedControl.selectedSegmentIndex = 1;
        [_segmentedControl addTarget:self action:@selector(segmentedControlValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.navigationBar.alpha = 0.01;

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.alpha = 1.0;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNav];
    
    self.recordScrollerView.hidden = NO;
    [self.recordScrollerView setPageIndex:1 animated:NO];
}

#pragma mark - HDJRecordTopViewDelegate
- (void)recordTopView:(HDJRecordTopView*)recordTopView tapWithAmountLabel:(UILabel*)amountLabel{
    [self.keyboardView show];
}

#pragma mark - HDJRecordScrollerViewDelegate
- (void)recordScrollerView:(HDJRecordScrollerView*)recordScrollerView currentPage:(NSInteger)pageIndex{
    self.segmentedControl.selectedSegmentIndex = pageIndex;
}

#pragma mark - HDJRecordViewDelegate
- (void)recordView:(HDJRecordView*)recordView chooseItemWithImage:(UIImage*)image andTitle:(NSString*)title{
    
}
- (void)editWithRecordView:(HDJRecordView*)recordView{
    HDJEditCategoryController* next = [HDJEditCategoryController new];
    next.type = recordView.type;
    [self.navigationController pushViewController:next animated:YES];
}

#pragma mark - SEL
- (void)segmentedControlValueChange:(UISegmentedControl*)sender{
    [self.recordScrollerView setPageIndex:sender.selectedSegmentIndex animated:YES];
}

#pragma mark - method
- (void)initNav{
    
    
    self.navigationItem.titleView = self.segmentedControl;
    self.view.backgroundColor = CLEARCOLOR;
    UIImageView* bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_pic"]];
    [self.view addSubview:bgImageView];
    bgImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.navButtonLeft.hidden = YES;
    
    self.navButtonRight.frame = CGRectMake(0, 0, 15, 15);
    [self.navButtonRight setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
}

- (void)navRightPressed:(id)sender {
    DLog(@"=> navRightPressed !");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
