//
//  HDJBillHeaderView.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/16.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJBillHeaderView.h"

@implementation HDJBillHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    WS(weakSelf)
    
    _bgView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_bgView];
    
    UIView* line = [UIView new];
    line.backgroundColor = LINE_WHITE_COLOR;
    [_bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(0.75);
    }];
    

    CGFloat size = adaptHeight(60);
    UILabel* meLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - size)*0.5, (adaptHeight(HDJBillHeaderView_Height) - size)*0.5, size, size)];
    [self addSubview:meLabel];
    meLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
    meLabel.text  = @"Max";
    meLabel.textAlignment = NSTextAlignmentCenter;
    meLabel.textColor = WHITE_COLOR;
    meLabel.backgroundColor = RGB(102, 102, 255);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:meLabel.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(size / 2, size / 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = meLabel.bounds;
    maskLayer.path = maskPath.CGPath;
    meLabel.layer.mask = maskLayer;


    UILabel* incomeLab = [UILabel createLabelWithFontSize:adaptFont(12) andTextColor:WHITE_COLOR andText:@"收入"];
    [self addSubview:incomeLab];
    [incomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-weakSelf.width * 0.25);
        make.bottom.mas_equalTo(meLabel.mas_centerY);
    }];
    
    _totalIncomeLabel = [UILabel createLabelWithFontSize:adaptFont(12) andTextColor:WHITE_COLOR andText:@"0.00"];
    [self addSubview:_totalIncomeLabel];
    [_totalIncomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(incomeLab.mas_centerX);
        make.top.mas_equalTo(meLabel.mas_centerY);
    }];

    
    UILabel* expendLab = [UILabel createLabelWithFontSize:adaptFont(12) andTextColor:WHITE_COLOR andText:@"支出"];
    [self addSubview:expendLab];
    [expendLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.width * 0.25);
        make.bottom.mas_equalTo(meLabel.mas_centerY);
    }];
    
    _totalExpendLabel = [UILabel createLabelWithFontSize:adaptFont(12) andTextColor:WHITE_COLOR andText:@"0.00"];
    [self addSubview:_totalExpendLabel];
    [_totalExpendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(expendLab.mas_centerX);
        make.top.mas_equalTo(meLabel.mas_centerY);
    }];

}


@end
