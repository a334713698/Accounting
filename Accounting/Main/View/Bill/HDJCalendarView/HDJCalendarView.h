//
//  HDJCalendarView.h
//  Accounting
//
//  Created by 洪冬介 on 2018/1/30.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "BaseView.h"

@interface HDJCalendarView : BaseView

@property (nonatomic, strong) UILabel *timeLabel;

- (UIImage*)getDateImage;

@end
