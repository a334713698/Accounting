//
//  HDJKeyBoardNumView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJKeyBoardNumView.h"
#import "HDJKeyBoardButton.h"

@implementation HDJKeyBoardNumView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    NSArray* allKeyBoardButtonArr = [HDJKeyBoardButtonModel getAllKeyBoardButtonModel];
    NSInteger idx = 0;
    CGFloat topMargin = 1;
    CGFloat leftMargin = 1;
    CGFloat column = 4;
    CGFloat rows = 4;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = (self.frame.size.width - (column - 1) * leftMargin) / column;
    CGFloat height = (self.frame.size.height - (rows - 1) * topMargin) / rows;
    for (NSInteger i = 0; i < rows; i++) {
        for (NSInteger j = 0; j < column; j++) {
            HDJKeyBoardButton* kbButton = [HDJKeyBoardButton new];
            [self addSubview:kbButton];
            x = (leftMargin + width) * j;
            y = (topMargin + height) * i;
            kbButton.frame = CGRectMake(x, y, width, height);
            kbButton.btnModel = allKeyBoardButtonArr[idx++];
            [kbButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}


- (void)btnClick:(HDJKeyBoardButton*)sender{
    HDJKeyBoardButtonModel *btnModel = sender.btnModel;
    DLog(@"%ld",btnModel.type);
    DLog(@"%@",btnModel.text);
}

@end
