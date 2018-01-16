//
//  HDJBillDisplayCell.h
//  Accounting
//
//  Created by 洪冬介 on 2018/1/15.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDJIERecordModel.h"

#define HDJBillDisplayCell_Height 60

@interface HDJBillDisplayCell : UITableViewCell

@property (nonatomic, strong) UILabel *incomeLabel;//左
@property (nonatomic, strong) UILabel *incomeAmountLabel;
@property (nonatomic, strong) UILabel *expendLabel;//右
@property (nonatomic, strong) UILabel *expendAmountLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) HDJIERecordModel *recordModel;

@end
