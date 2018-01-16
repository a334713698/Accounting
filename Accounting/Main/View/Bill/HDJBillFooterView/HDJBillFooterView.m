//
//  HDJBillFooterView.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/16.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJBillFooterView.h"

@implementation HDJBillFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    UIView* line = [UIView new];
    line.backgroundColor = LINE_WHITE_COLOR;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(adaptHeight(30));
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(0.75);
    }];

    CGFloat iconSize = adaptHeight(27);
    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_smile"]];
    [self addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(line.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(iconSize, iconSize));
    }];

    UILabel* descLabel = [UILabel new];
    [self addSubview:descLabel];
    descLabel.font = [UIFont systemFontOfSize:adaptFont(12)];
    descLabel.text  = @"Max‘s\n口袋记账旅程";
    descLabel.textColor = WHITE_COLOR;
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.numberOfLines = 2;
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];

}


@end
