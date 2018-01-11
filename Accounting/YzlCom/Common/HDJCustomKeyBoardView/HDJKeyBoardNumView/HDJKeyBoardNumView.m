//
//  HDJKeyBoardNumView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJKeyBoardNumView.h"

@interface HDJKeyBoardNumView()

@property (nonatomic, strong) NSMutableString *mutableString;


@end

@implementation HDJKeyBoardNumView

- (NSMutableString *)mutableString{
    if (!_mutableString) {
        _mutableString = [NSMutableString string];
    }
    return _mutableString;
}

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
    HDJKeyBoardButtonType type = btnModel.type;
    DLog(@"%ld",btnModel.type);
    DLog(@"%@",btnModel.text);
    
    
    if(type == HDJKeyBoardButtonTypeSure){
        DLog(@"确定");
        
    }else if (type == HDJKeyBoardButtonTypeClear){
        DLog(@"清除");
        self.mutableString = [@"" mutableCopy];
    }else if (type == HDJKeyBoardButtonTypeSymbolAdd){
        DLog(@"符号加");
        
    }else if (type == HDJKeyBoardButtonTypeSymbolMinus){
        DLog(@"符号减");
        
    }else if (type == HDJKeyBoardButtonTypeBackspace){
        DLog(@"退格");
        if (self.mutableString.length > 0) {
            [self.mutableString deleteCharactersInRange:NSMakeRange(self.mutableString.length - 1, 1)];
        }
    }else if (type == HDJKeyBoardButtonTypePoint){
        DLog(@"小数点");
        if (![self.mutableString containsString:@"."]) {
            [self.mutableString appendString:btnModel.text];
        }
    }else{
        DLog(@"数字%@",btnModel.text);
        [self.mutableString appendString:btnModel.text];
    }
    
    [self judgeAvailable];
    
    if ([self.delegate respondsToSelector:@selector(keyBoardNumView:withButton:withButtonModel:withButtonType:withButtonText:)]) {
        [self.delegate keyBoardNumView:self withButton:sender withButtonModel:btnModel withButtonType:btnModel.type withButtonText:[self.mutableString copy]];
    }
}

- (void)judgeAvailable{
    if ([self.mutableString doubleValue] && [self.mutableString containsString:@"."]) {
        NSArray<NSString*>* numArr = [self.mutableString componentsSeparatedByString:@"."];
        NSString* integerStr = numArr.firstObject;
        NSString* decimalStr = numArr.lastObject;
        
        NSString* newDecimalStr = decimalStr;
        if (decimalStr.length > 2) {
            newDecimalStr = [decimalStr substringToIndex:2];
        }
        self.mutableString = [NSMutableString stringWithFormat:@"%@.%@",integerStr,newDecimalStr];
        DLog(@"里：%@",self.mutableString);
    }
    DLog(@"外：%@",self.mutableString);
}

@end
