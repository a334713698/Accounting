//
//  HDJTableViewCell.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/8.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJTableViewCell.h"

@implementation HDJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{

    _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_star"]];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(adaptWidth(12));
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(adaptWidth(ICON_SIZE), adaptWidth(ICON_SIZE)));
    }];

    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
    _titleLabel.text  = @"name";
    _titleLabel.textColor = BLACK_COLOR;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(adaptWidth(8));
        make.centerY.mas_equalTo(0);
    }];

}

@end
