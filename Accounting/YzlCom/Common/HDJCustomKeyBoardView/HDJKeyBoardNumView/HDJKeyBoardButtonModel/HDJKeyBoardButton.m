//
//  HDJKeyBoardButton.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJKeyBoardButton.h"

@implementation HDJKeyBoardButtonModel

+ (NSArray<HDJKeyBoardButtonModel*>*)getAllKeyBoardButtonModel{
    NSMutableArray* allKeyBoardButtonArr = [NSMutableArray array];
    NSArray* typeArr = @[@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeBackspace),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeSymbolAdd),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypeSymbolMinus),@(HDJKeyBoardButtonTypeClear),@(HDJKeyBoardButtonTypeNumber),@(HDJKeyBoardButtonTypePoint),@(HDJKeyBoardButtonTypeSure)];
    NSArray* textArr = @[@"7",@"8",@"9",@"icon_backspace",@"4",@"5",@"6",@"+",@"1",@"2",@"3",@"-",@"C",@"0",@".",@"确定"];
    
    for (NSInteger i = 0; i < typeArr.count; i++) {
        HDJKeyBoardButtonModel* model = [HDJKeyBoardButtonModel new];
        model.text = textArr[i];
        model.type = [typeArr[i] integerValue];
        [allKeyBoardButtonArr addObject:model];
    }
    
    return [allKeyBoardButtonArr copy];
}

@end

@implementation HDJKeyBoardButton

- (void)setBtnModel:(HDJKeyBoardButtonModel *)btnModel{
    _btnModel = btnModel;
    self.backgroundColor = RGB(50, 50, 50);
    
    if (btnModel.type == HDJKeyBoardButtonTypeBackspace) {
        [self setImage:[UIImage imageNamed:btnModel.text] forState:UIControlStateNormal];
    }else{
        self.titleLabel.font = [UIFont systemFontOfSize:adaptFont(20)];
        [self setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [self setTitle:btnModel.text forState:UIControlStateNormal];
    }
}



@end
