//
//  HDJTableViewCell.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/8.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJTableViewCell.h"

@implementation HDJTableViewCell

#pragma mark - lazy load
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_star"]];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(adaptWidth(12));
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(adaptWidth(ICON_SIZE), adaptWidth(ICON_SIZE)));
        }];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
        _titleLabel.text  = @"title";
        _titleLabel.textColor = BLACK_COLOR;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconImageView.mas_right).offset(adaptWidth(8));
            make.centerY.mas_equalTo(0);
        }];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        [self.contentView addSubview:_detailLabel];
        _detailLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
        _detailLabel.text  = @"detail";
        _detailLabel.textColor = BLACK_COLOR;
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-adaptWidth(8));
            make.centerY.mas_equalTo(0);
        }];
    }
    return _detailLabel;
}

- (UILabel *)otherLabel{
    if (!_otherLabel) {
        _otherLabel = [UILabel new];
        [self.contentView addSubview:_otherLabel];
        _otherLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
        _otherLabel.text  = @"other";
        _otherLabel.textColor = BLACK_COLOR;
        [_otherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _otherLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{

}

@end
