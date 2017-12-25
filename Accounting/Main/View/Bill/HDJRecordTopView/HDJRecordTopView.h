//
//  HDJRecordTopView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"
@class HDJRecordTopView;

@protocol HDJRecordTopViewDelegate <NSObject>

- (void)recordTopView:(HDJRecordTopView*)recordTopView tapWithAmountLabel:(UILabel*)amountLabel;

@end


@interface HDJRecordTopView : BaseView

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *amountLabel;

@property (nonatomic, weak) id<HDJRecordTopViewDelegate> delegate;
@end
