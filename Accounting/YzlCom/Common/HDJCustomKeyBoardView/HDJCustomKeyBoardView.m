//
//  HDJCustomKeyBoardView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/24.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJCustomKeyBoardView.h"

@interface HDJCustomKeyBoardView()<HDJKeyBoardNumViewDelegate>

@property (nonatomic, strong) HDJKeyBoardExtraFuncView *extraFuncView;
@property (nonatomic, strong) HDJKeyBoardNumView *numView;

@end

@implementation HDJCustomKeyBoardView

- (HDJKeyBoardExtraFuncView *)extraFuncView{
    if (!_extraFuncView) {
        _extraFuncView = [[HDJKeyBoardExtraFuncView alloc] initWithFrame:CGRectMake(0, 1, self.frame.size.width, ExtraFuncView_Height)];
        [self addSubview:_extraFuncView];
        WS(weakSelf)
        [[_extraFuncView.downButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf hide];
        }];
    }
    return _extraFuncView;
}

- (HDJKeyBoardNumView *)numView{
    if (!_numView) {
        CGFloat y = CGRectGetMaxY(self.extraFuncView.frame) + 1;
        _numView = [[HDJKeyBoardNumView alloc] initWithFrame:CGRectMake(0, y, self.frame.size.width, self.frame.size.height - y)];
        [self addSubview:_numView];
        _numView.delegate = self;
    }
    return _numView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView{
    self.backgroundColor = RGB(65, 65, 65);
    self.extraFuncView.hidden = NO;
    self.numView.hidden = NO;
}

- (void)show{
    WS(weakSelf)
    [UIView animateWithDuration:CustomKeyBoard_Animate_Duration animations:^{
        CGRect rect = weakSelf.frame;
        rect.origin.y = SCREEN_HEIGHT - weakSelf.frame.size.height;
        weakSelf.frame = rect;
    }];
}

- (void)hide{
    WS(weakSelf)
    [UIView animateWithDuration:CustomKeyBoard_Animate_Duration animations:^{
        CGRect rect = weakSelf.frame;
        rect.origin.y = SCREEN_HEIGHT;
        weakSelf.frame = rect;
    }];
}

#pragma mark - HDJKeyBoardNumViewDelegate
- (void)keyBoardNumView:(HDJKeyBoardNumView*)keyBoardNumView withButton:(HDJKeyBoardButton*)sender withButtonModel:(HDJKeyBoardButtonModel*)model withButtonType:(HDJKeyBoardButtonType)type withButtonText:(NSString*)text{
    if ([self.delegate respondsToSelector:@selector(customKeyBoardView:withKeyBoardNumView:withButton:withButtonModel:withButtonType:withButtonText:)]) {
        [self.delegate customKeyBoardView:self withKeyBoardNumView:keyBoardNumView withButton:sender withButtonModel:model withButtonType:type withButtonText:text];
    }

}

@end
