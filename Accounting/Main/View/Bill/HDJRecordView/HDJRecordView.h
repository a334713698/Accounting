//
//  HDJRecordView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"
#import "HDJRecordTopView.h"

@class HDJRecordView;

@protocol HDJRecordViewDelegate <NSObject>

- (void)recordView:(HDJRecordView*)recordView chooseItemWithImage:(UIImage*)image andTitle:(NSString*)title;
- (void)editWithRecordView:(HDJRecordView*)recordView;

@end

@interface HDJRecordView : BaseView

@property (nonatomic, strong) HDJRecordTopView *recordTopView;
@property (nonatomic, assign) HDJProjectType type;
@property (nonatomic, weak) id<HDJRecordViewDelegate> delegate;

@end
