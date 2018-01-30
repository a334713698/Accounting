//
//  HDJCalendarView.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/30.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "HDJCalendarView.h"

@implementation HDJCalendarView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self initSubview];
//    }
//    return self;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    CGFloat imageSize = 20;
    self.frame = CGRectMake(0, 0, imageSize, imageSize);
    CGFloat imageOrigin = (self.width - imageSize) * 0.5;
    UIImageView* calendarIV = [[UIImageView alloc] initWithFrame:CGRectMake(imageOrigin, imageOrigin, imageSize, imageSize)];
    [self addSubview:calendarIV];
    calendarIV.image = [UIImage imageNamed:@"icon_calendar"];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 5, imageSize - 2*2, imageSize - 2 - 5)];
    [calendarIV addSubview:_timeLabel];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.text  = @"1";
    _timeLabel.textColor = WHITE_COLOR;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
//    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.mas_equalTo(5);
////        make.bottom.mas_equalTo(-1);
////        make.centerX.mas_equalTo(0);
//        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 2, 2, 2));
//    }];
//    [self layoutIfNeeded];
    
    
}

- (UIImage*)getDateImage{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd"];
    NSString *currentDateString = [dateFormatter stringFromDate:[NSDate new]];
    _timeLabel.text = currentDateString;
    
    CGSize s = self.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
