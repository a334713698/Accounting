//
//  HDJKeyBoardButton.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

typedef enum : NSInteger {
    HDJKeyBoardButtonTypeNumber,//数字键
    HDJKeyBoardButtonTypeClear,//清除
    HDJKeyBoardButtonTypeSymbolAdd,//符号加
    HDJKeyBoardButtonTypeSymbolMinus,//符号减
    HDJKeyBoardButtonTypeSure,//确定
    HDJKeyBoardButtonTypeBackspace,//退格
    HDJKeyBoardButtonTypePoint//小数点
} HDJKeyBoardButtonType;

@interface HDJKeyBoardButtonModel : BaseModel

@property (nonatomic, assign) HDJKeyBoardButtonType type;
@property (nonatomic, copy) NSString *text;

+ (NSArray<HDJKeyBoardButtonModel*>*)getAllKeyBoardButtonModel;

@end


@interface HDJKeyBoardButton : UIButton

@property (nonatomic, strong) HDJKeyBoardButtonModel *btnModel;

@end
