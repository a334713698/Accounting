//
//  HDJBillDisplayCell.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/15.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJBillDisplayCell.h"

@implementation HDJBillDisplayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    CGFloat iconSize = adaptHeight(20);
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - iconSize)*0.5, (adaptHeight(HDJBillDisplayCell_Height) - iconSize)*0.5, iconSize, iconSize)];
    [self.contentView addSubview:_iconImageView];
    _iconImageView.backgroundColor = BACKGROUND_COLOR;
//    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(0);
//        make.centerY.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(iconSize, iconSize));
//    }];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_iconImageView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(iconSize / 2, iconSize / 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _iconImageView.bounds;
    maskLayer.path = maskPath.CGPath;
    _iconImageView.layer.mask = maskLayer;

    
    _incomeLabel = [UILabel new];
    [self.contentView addSubview:_incomeLabel];
    _incomeLabel.font = [UIFont systemFontOfSize:adaptFont(12)];
    _incomeLabel.text  = @"收入";
    _incomeLabel.textColor = BLACK_COLOR;
    [_incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_iconImageView.mas_left).offset(-adaptWidth(8));
        make.centerY.mas_equalTo(0);
    }];

    _expendLabel = [UILabel new];
    [self.contentView addSubview:_expendLabel];
    _expendLabel.font = [UIFont systemFontOfSize:adaptFont(12)];
    _expendLabel.text  = @"支出";
    _expendLabel.textColor = BLACK_COLOR;
    [_expendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(adaptWidth(8));
        make.centerY.mas_equalTo(0);
    }];
}

- (void)setRecordModel:(HDJIERecordModel *)recordModel{
    _recordModel = recordModel;
    _iconImageView.image = [UIImage imageNamed:recordModel.icon];
}

@end
