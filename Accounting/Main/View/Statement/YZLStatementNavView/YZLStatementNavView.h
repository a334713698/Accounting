//
//  YZLStatementNavView.h
//  Accounting
//
//  Created by 洪冬介 on 2018/2/24.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "BaseView.h"


@class YZLStatementNavView;
@protocol YZLStatementNavViewDelegate<NSObject>

- (void)titleView:(YZLStatementNavView*)navView btnDidClickWithIndex:(NSInteger)index;

@end


@interface YZLStatementNavView : BaseView

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray<UIButton*> *btnArr;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, weak) id<YZLStatementNavViewDelegate> delegate;

@end
