//
//  BaseViewController.h
//  mall
//
//  Created by irene on 16/3/8.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJDatabaseManager.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIView   *statusBarBgView;        // 状态栏背景视图（默认红色）
@property (nonatomic, strong) UIButton *navButtonLeft;          // 导航栏左侧按钮（默认返回）
@property (nonatomic, strong) UIButton *navButtonRight;         // 导航栏右侧按钮（默认没有）
@property (nonatomic, copy)   NSString *navTitle;               // 导航栏标题（默认无内容）

@property (nonatomic, strong) DJDatabaseManager* dbMgr;

@end
