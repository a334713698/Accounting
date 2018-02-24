//
//  HDJScrollerView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/20.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJScrollerView.h"

@interface HDJScrollerView()<UIScrollViewDelegate>

@end

@implementation HDJScrollerView

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"pageIndex"];
}

- (instancetype)initWithFrame:(CGRect)frame andSubviews:(NSArray*)subviews
{
    self = [super initWithFrame:frame];
    if (self) {
        _subviews = subviews;
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    for (NSInteger i = 0; i < _subviews.count; i++) {
        UIView* view = _subviews[i];
        [self addSubview:view];
        view.frame = CGRectMake(i * self.width, 0, self.width, self.height);
    }
    self.delegate = self;
    self.pagingEnabled = YES;
    self.bounces = NO;
    self.contentSize = CGSizeMake(self.width * _subviews.count, 0);
    [self addObserver:self forKeyPath:@"pageIndex" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
}

- (void)setPageIndex:(NSInteger)pageIndex animated:(BOOL)animated{
    _pageIndex = pageIndex;
    [self setContentOffset:CGPointMake(_pageIndex * self.width, 0) animated:animated];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = (NSInteger)(scrollView.contentOffset.x + self.width / 2.0)/self.width;
    [self setValue:@(page) forKey:@"pageIndex"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSInteger oldValue = [change[NSKeyValueChangeOldKey] integerValue];
    NSInteger newValue = [change[NSKeyValueChangeNewKey] integerValue];
    if (oldValue != newValue && [self.scrollerViewPageDelegate respondsToSelector:@selector(scrollerView:currentPage:)]) {
        [self.scrollerViewPageDelegate scrollerView:self currentPage:newValue];
    }
}

@end
