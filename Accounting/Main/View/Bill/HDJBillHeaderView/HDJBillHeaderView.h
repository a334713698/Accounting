//
//  HDJBillHeaderView.h
//  Accounting
//
//  Created by 洪冬介 on 2018/1/16.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "BaseView.h"

#define HDJBillHeaderView_Height 88

@interface HDJBillHeaderView : BaseView

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *totalIncomeLabel;
@property (nonatomic, strong) UILabel *totalExpendLabel;


@end
