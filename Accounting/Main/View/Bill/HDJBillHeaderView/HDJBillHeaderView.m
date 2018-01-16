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
    UIView* line = [UIView new];
    line.backgroundColor = LINE_WHITE_COLOR;
    [self addSubview:line];
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


    
}


@end
