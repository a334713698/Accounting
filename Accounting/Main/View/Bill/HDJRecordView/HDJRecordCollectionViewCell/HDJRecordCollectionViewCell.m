//
//  HDJRecordCollectionViewCell.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJRecordCollectionViewCell.h"

@implementation HDJRecordCollectionViewCell

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
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(adaptWidth(ICON_SIZE), adaptWidth(ICON_SIZE)));
    }];
    
    _nameLabel = [UILabel new];
    [self addSubview:_nameLabel];
    _nameLabel.text = @"名称";
    _nameLabel.textColor = WHITE_COLOR;
    _nameLabel.font = [UIFont systemFontOfSize:adaptFont(12)];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.iconImageView.mas_bottom).offset(5);
        make.centerX.mas_equalTo(0);
    }];
    
}

@end
