//
//  HDJRecordScrollerView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/20.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDJRecordScrollerView;

@protocol HDJRecordScrollerViewDelegate <NSObject>

- (void)recordScrollerView:(HDJRecordScrollerView*)recordScrollerView currentPage:(NSInteger)pageIndex;

@end

@interface HDJRecordScrollerView : UIScrollView

@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, strong) NSArray *subviews;
@property (nonatomic, weak) id<HDJRecordScrollerViewDelegate> recordScrollerViewPageDelegate;

- (void)setPageIndex:(NSInteger)pageIndex animated:(BOOL)animated;
- (instancetype)initWithFrame:(CGRect)frame andSubviews:(NSArray*)subviews;

@end
