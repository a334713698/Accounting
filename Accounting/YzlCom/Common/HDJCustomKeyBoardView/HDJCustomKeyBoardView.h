//
//  HDJCustomKeyBoardView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/24.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"
#import "HDJKeyBoardExtraFuncView.h"
#import "HDJKeyBoardNumView.h"

#define CustomKeyBoard_Height 245
#define CustomKeyBoard_Animate_Duration 0.3


@class HDJCustomKeyBoardView;
@protocol HDJCustomKeyBoardViewDelegate<NSObject>

- (void)customKeyBoardView:(HDJCustomKeyBoardView*)customKeyBoardView withKeyBoardNumView:(HDJKeyBoardNumView*)keyBoardNumView withButton:(HDJKeyBoardButton*)sender withButtonModel:(HDJKeyBoardButtonModel*)model withButtonType:(HDJKeyBoardButtonType)type withButtonText:(NSString*)resultText;

- (void)hiddenCustomKeyBoardView:(HDJCustomKeyBoardView*)customKeyBoardView;
@end


@interface HDJCustomKeyBoardView : BaseView

@property (nonatomic, weak) id<HDJCustomKeyBoardViewDelegate> delegate;

- (void)show;

- (void)hide;

@end
