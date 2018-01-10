//
//  TabBarViewController.m
//  Wedding
//
//  Created by irene on 16/5/11.
//  Copyright © 2016年 HYcompany. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "HDJPropertyViewController.h"
#import "HDJStatementViewController.h"
#import "HDJBillViewController.h"
#import "HDJManageViewController.h"
#import "HDJMoreViewController.h"
#import "HDJAddRecordViewController.h"


#define TAG_BTN 0x0100
#define ADD_BTN_HEIGHT 35

@interface TabBarViewController () {
    NSMutableArray<UIButton*> *_buttonArr;
}

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation TabBarViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
}

- (UIButton *)addButton{
    if (!_addButton) {
        CGFloat size = ADD_BTN_HEIGHT;
        _addButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - size) * 0.5, (TABBAR_HEIGHT - size) * 0.5, size, size)];
        [self.tabBar addSubview:_addButton];
        [_addButton setImage:[UIImage imageNamed:@"tabbar_add"] forState:UIControlStateNormal];
        [_addButton setImage:[UIImage imageNamed:@"tabbar_add"] forState:UIControlStateHighlighted];
        [_addButton addTarget:self action:@selector(enterHDJAddRecordViewController) forControlEvents:UIControlEventTouchUpInside];
        _addButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return _addButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.初始化子视图
    [self initSubviews];
    
    // 2.自定义标签栏
    [self initCustomTabBarView];
    
    self.selectedIndex = 2;
}

- (void)viewDidLayoutSubviews {
    // 1.移除系统tabbar按钮
    [self removeSystemTabbarButton];
}

#pragma mark - 初始化子视图
- (void)initSubviews {

    NSArray *viewControllers = @[@"HDJPropertyViewController",@"HDJStatementViewController",@"HDJBillViewController",@"HDJManageViewController",@"HDJMoreViewController"];
    
    // 创建导航控制器
    NSMutableArray *baseNavs = [NSMutableArray array];
    
    for (NSInteger i = 0; i < viewControllers.count; i++) {
        Class cls = NSClassFromString(viewControllers[i]);
        if (cls) {
            BaseViewController *controller = [[cls alloc] init];
            BaseNavigationController *nav= [[BaseNavigationController alloc] initWithRootViewController:controller];
            [baseNavs addObject:nav];
        }
    }
    self.viewControllers = baseNavs;
    
}

#pragma mark - 自定义标签栏
- (void)initCustomTabBarView {
    // 1.移除系统tabbar按钮
    [self removeSystemTabbarButton];
    
    // 2.创建标签栏按钮
    // 01.标签栏按钮图片名字数组，标题名字数组
    NSArray *imageNames = @[@"tabbar_property_unselected",@"tabbar_statement_unselected",@"tabbar_bill_unselected",@"tabbar_manage_unselected",@"tabbar_more_unselected"];
    NSArray *imageNames_selected = @[@"tabbar_property_selected",@"tabbar_statement_selected",@"tabbar_bill_selected",@"tabbar_manage_selected",@"tabbar_more_selected"];
    NSArray *titles = @[@"资产",@"报表",@"账单",@"理财",@"更多"];
    // 02.标签栏的宽度
    float width_button = SCREEN_WIDTH / (float)imageNames.count;
    // 03.创建按钮
    _buttonArr = [NSMutableArray new];
    for (NSInteger i = 0; i < imageNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width_button * i, 0, width_button, TABBAR_HEIGHT);
        button.backgroundColor = [UIColor clearColor];
        button.tag = i + TAG_BTN;
        [button setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageNames_selected[i]] forState:UIControlStateSelected];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:GRAY_COLOR forState:UIControlStateNormal];
        [button setTitleColor:MAIN_COLOR forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:0.0];
        [self.tabBar addSubview:button];
        [_buttonArr addObject:button];
        
        if (i == 0) {//当刚进入时，选择第一个按钮作为选中状态
            button.selected = YES;
            self.selectedIndex = i;
        }
    }
}

// 标签按钮点击事件
- (void)buttonAction:(UIButton *)item {
    self.selectedIndex = item.tag - TAG_BTN;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    for (int i = 0; i < _buttonArr.count; i++) {
        UIButton *button = (UIButton *)_buttonArr[i];
        button.selected = NO;
    }
    UIButton *selectButton = (UIButton *)_buttonArr[selectedIndex];
    selectButton.selected = YES;
    
    DLog(@"%ld",selectedIndex);
    if (_buttonArr.count == 5) {
        if (selectedIndex == 2) {
            self.addButton.hidden = NO;
            [self settingAddButtonHiedden:NO];
            _buttonArr[2].hidden = YES;
            
        }else{
            self.addButton.hidden = YES;
            [self settingAddButtonHiedden:YES];
            _buttonArr[2].hidden = NO;
        }
    }
}

- (void)settingAddButtonHiedden:(BOOL)isHidden{
    self.addButton.hidden = isHidden;
    if(isHidden){
        CGFloat btnH = ADD_BTN_HEIGHT - 10;
        self.addButton.frame = CGRectMake((SCREEN_WIDTH - btnH) * 0.5, (TABBAR_HEIGHT - btnH) * 0.5, btnH, btnH);
    }else{
        WS(weakSelf)
        [UIView animateWithDuration:0.13 animations:^{
            weakSelf.addButton.frame = CGRectMake((SCREEN_WIDTH - ADD_BTN_HEIGHT) * 0.5, (TABBAR_HEIGHT - ADD_BTN_HEIGHT) * 0.5, ADD_BTN_HEIGHT, ADD_BTN_HEIGHT);
        }];
    }
}

//弹出添加账单记录界面
- (void)enterHDJAddRecordViewController{
    HDJAddRecordViewController* vc = [HDJAddRecordViewController new];
    BaseNavigationController* nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

// 移除系统tabbar按钮 UITabBarButton
- (void)removeSystemTabbarButton {
    // 遍历tabbar上面的所有子视图，移除上面的按钮
    for (UIView *view in self.tabBar.subviews) {
        Class c = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:[c class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
