//
//  HDJCateCollectionViewCell.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/22.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJCateCollectionViewCell.h"

@implementation HDJCateCollectionViewCell

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
    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_star"]];
    [self addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(adaptWidth(ICON_SIZE), adaptWidth(ICON_SIZE)));
    }];
}

@end
