//
//  HDJKeyBoardExtraFuncView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJKeyBoardExtraFuncView.h"

@implementation HDJKeyBoardExtraFuncView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView{
    self.backgroundColor = RGB(50, 50, 50);
    
    NSString* time = [NSString stringWithFormat:@"  %@  ",[NSDate dateToCustomString:[NSDate new] andDateFormat:@"MM月dd日"]];
    
    UIButton* dateButton = [UIButton new];
    [self addSubview:dateButton];
    [dateButton setTitle:time forState:UIControlStateNormal];
    [dateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(27);
    }];
    [self setButtomParam:dateButton];
    
    UIButton* payTypeButton = [UIButton new];
    [self addSubview:payTypeButton];
    [payTypeButton setTitle:@"  支付宝  " forState:UIControlStateNormal];
    [payTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(dateButton.mas_right).offset(8);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(27);
    }];
    [self setButtomParam:payTypeButton];
    

    UIButton* downButton = [UIButton new];
    [self addSubview:downButton];
    [downButton setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
    [downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(30);
    }];
    _downButton = downButton;
}

- (void)setButtomParam:(UIButton*)btn{
    UIColor* borderColor = RGB(65, 65, 65);
    UIFont* font = [UIFont systemFontOfSize:adaptFont(14.5)];
    
    btn.titleLabel.font = font;
    [btn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 3;
    btn.layer.masksToBounds = YES;
}

@end
