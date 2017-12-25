//
//  HDJAddCategoryTopView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/22.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJAddCategoryTopView.h"

@implementation HDJAddCategoryTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView{
    WS(weakSelf)
    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_star"]];
    [self addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(adaptWidth(40), adaptWidth(40)));
    }];
    
    
    _cateTextField = [UITextField new];
    _cateTextField.placeholder = @"自定义输入名称";
    _cateTextField.font = [UIFont systemFontOfSize:adaptFont(16.5)];
    [self addSubview:_cateTextField];
    [_cateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(5);
        make.right.mas_equalTo(-5);
        make.centerY.mas_equalTo(0);
//        make.top.mas_equalTo(weakSelf.iconImageView.mas_top).offset(5);
//        make.bottom.mas_equalTo(weakSelf.iconImageView.mas_bottom).offset(-5);
    }];
    
    UIView* line = [UIView new];
    [self addSubview:line];
    line.backgroundColor = LINE_COLOR_GRAY_DARK;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

@end
