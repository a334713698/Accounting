//
//  HDJEditCategoryController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/21.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJEditCategoryController.h"
#import "HDJAddCategoryController.h"

@interface HDJEditCategoryController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HDJEditCategoryController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.01, 0.01)];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNav];
    
    self.tableView.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse_id = @"cateCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuse_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse_id];
    }
    cell.imageView.image = [UIImage imageNamed:@"icon_star"];
    cell.textLabel.text = @"Cate";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

removeCellSeparator

- (void)initNav{
    self.navTitle = @"编辑分类";
    
    self.view.backgroundColor = WHITE_COLOR;
    
    self.navButtonLeft.frame = CGRectMake(0, 0, NavigationBarIcon + NAVIGATIONBAR_HEIGHT, NAVIGATIONBAR_HEIGHT);
    [self.navButtonLeft setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [self.navButtonLeft setTitle:@"" forState:UIControlStateNormal];
    
    [self.navButtonRight setTitle:@"添加" forState:UIControlStateNormal];
}

- (void)navRightPressed:(id)sender {
    DLog(@"=> navRightPressed !");
    HDJAddCategoryController* next = [HDJAddCategoryController new];
    [self.navigationController pushViewController:next animated:YES];
}

@end
