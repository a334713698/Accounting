//
//  HDJScrollerView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/20.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDJScrollerView;

@protocol HDJScrollerViewDelegate <NSObject>

- (void)scrollerView:(HDJScrollerView*)scrollerView currentPage:(NSInteger)pageIndex;

@end

@interface HDJScrollerView : UIScrollView

@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, strong) NSArray *subviews;
@property (nonatomic, weak) id<HDJScrollerViewDelegate> scrollerViewPageDelegate;

- (void)setPageIndex:(NSInteger)pageIndex animated:(BOOL)animated;
- (instancetype)initWithFrame:(CGRect)frame andSubviews:(NSArray*)subviews;

@end
