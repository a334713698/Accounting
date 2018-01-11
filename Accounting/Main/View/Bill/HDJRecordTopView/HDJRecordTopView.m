//
//  HDJRecordTopView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJRecordTopView.h"

@implementation HDJRecordTopView
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self initSubView];
//    }
//    return self;
//}

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
    
    _nameLabel = [UILabel new];
    [self addSubview:_nameLabel];
    _nameLabel.text = @"名称";
    _nameLabel.textColor = WHITE_COLOR;
    _nameLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(8);
        make.centerY.mas_equalTo(0);
    }];
    

    _amountLabel = [UILabel new];
    [self addSubview:_amountLabel];
    _amountLabel.text = @"0.00";
    _amountLabel.textColor = WHITE_COLOR;
    _amountLabel.font = [UIFont boldSystemFontOfSize:adaptFont(22)];
    _amountLabel.textAlignment = NSTextAlignmentRight;
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-adaptWidth(12));
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(self.mas_centerX);
    }];
    _amountLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer* tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doAmountTap:)];
    [_amountLabel addGestureRecognizer:tapRec];
    
    UIView* line = [UIView new];
    [self addSubview:line];
    line.backgroundColor = RGB(65, 65, 65);
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)doAmountTap:(UITapGestureRecognizer*)sender{
    if([self.delegate respondsToSelector:@selector(recordTopView:tapWithAmountLabel:)]){
        [self.delegate recordTopView:self tapWithAmountLabel:_amountLabel];
    }
}

@end
