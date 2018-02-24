//
//  YZLStatementCateView.m
//  Accounting
//
//  Created by 洪冬介 on 2018/2/24.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "YZLStatementCateView.h"
#import "HDJTableViewCell.h"
#import "YZLStatementCateHeaderView.h"

@interface YZLStatementCateView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *incomeCateArr;
@property (nonatomic, strong) NSMutableArray *expendCateArr;

@property (nonatomic, strong) YZLStatementCateHeaderView *headerView;

@end


@implementation YZLStatementCateView

- (NSMutableArray *)incomeCateArr{
    if (!_incomeCateArr) {
        _incomeCateArr = [NSMutableArray array];
    }
    return _incomeCateArr;
}

- (NSMutableArray *)expendCateArr{
    if (!_expendCateArr) {
        _expendCateArr = [NSMutableArray array];
    }
    return _expendCateArr;
}

- (YZLStatementCateHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[YZLStatementCateHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    }
    return _headerView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self addSubview:_tableView];
        _tableView.backgroundColor = BACKGROUND_COLOR;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.01, adaptHeight(10))];
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] > 11.0) {
            _tableView.estimatedSectionHeaderHeight = 10;
            _tableView.estimatedSectionFooterHeight = 0.01;
        }
        _tableView.tableHeaderView = self.headerView;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    self.backgroundColor = RED_COLOR;
    self.tableView.hidden = NO;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cateCell = @"cateCell";
    HDJTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cateCell];
    if (!cell) {
        cell = [[HDJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cateCell];
    }
    cell.iconImageView.hidden = NO;
    cell.titleLabel.hidden = NO;
    cell.detailLabel.hidden = NO;
    cell.otherLabel.hidden = NO;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DLog(@"cell：%ld-%ld",indexPath.section,indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight(44);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}


@end
