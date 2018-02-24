//
//  YZLStatementNavView.m
//  Accounting
//
//  Created by 洪冬介 on 2018/2/24.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "YZLStatementNavView.h"

@interface YZLStatementNavView()

@end

@implementation YZLStatementNavView

- (NSMutableArray<UIButton *> *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles{
    self = [super initWithFrame:frame];
    if (self) {
        _titles = titles;
        if (_titles.count) {
            [self initSubviews];
        }
    }
    return self;
}

- (void)initSubviews{
    UIView* titleView = [UIView new];
    [self addSubview:titleView];
    
    CGFloat margin = 8.0;
    CGFloat totalWidth = -margin;
    NSInteger index = 0;
    for (NSString* title in _titles) {
        UIButton* btn = [UIButton new];
        btn.tag = index++;
        [titleView addSubview:btn];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:RGB(65, 105, 225) forState:UIControlStateSelected];
        CGSize size = [btn.titleLabel labelAutoCalculateRect];
        totalWidth += margin;
        btn.frame = CGRectMake(totalWidth, 0, size.width, self.height);
        totalWidth += size.width;
        [self.btnArr addObject:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    titleView.frame = CGRectMake((self.width - 24 - totalWidth) * 0.5, 0, totalWidth, self.height);
    DLog(@"%lf",self.width);
    [self btnClick:self.btnArr.firstObject];
}

- (void)btnClick:(UIButton*)sender{
    self.currentIndex = sender.tag;
    if ([self.delegate respondsToSelector:@selector(titleView:btnDidClickWithIndex:)]) {
        [self.delegate titleView:self btnDidClickWithIndex:sender.tag];
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    for (UIButton* btn in self.btnArr) {
        btn.selected = 0;
    }
    self.btnArr[currentIndex].selected = 1;
}

@end
