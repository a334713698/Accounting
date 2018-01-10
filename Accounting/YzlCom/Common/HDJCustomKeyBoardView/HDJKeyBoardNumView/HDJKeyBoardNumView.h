//
//  HDJKeyBoardNumView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/25.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"
#import "HDJKeyBoardButton.h"

@class HDJKeyBoardNumView;
@protocol HDJKeyBoardNumViewDelegate<NSObject>

- (void)keyBoardNumView:(HDJKeyBoardNumView*)keyBoardNumView withButton:(HDJKeyBoardButton*)sender withButtonModel:(HDJKeyBoardButtonModel*)model withButtonType:(HDJKeyBoardButtonType)type withButtonText:(NSString*)text;

@end


@interface HDJKeyBoardNumView : BaseView

@property (nonatomic, weak) id<HDJKeyBoardNumViewDelegate> delegate;


@end
