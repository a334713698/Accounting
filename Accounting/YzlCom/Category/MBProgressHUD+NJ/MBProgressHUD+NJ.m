//
//  MBProgressHUD+NJ.m
//  Indiana
//
//  Created by irene on 16/3/29.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import "MBProgressHUD+NJ.h"

//CGFloat const MBProgressMaxOffset = 1000000.f;

@implementation MBProgressHUD (NJ)

/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.labelText = text;
//    hud.detailsLabelFont = [UIFont systemFontOfSize:adaptFont(15)];
//    hud.detailsLabelText = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:adaptFont(15)];
    hud.detailsLabel.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_hud_%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 默认1.5秒之后再消失
//    [hud hide:YES afterDelay:1.5f];
    [hud hideAnimated:YES afterDelay:1.5f];

//    if(text.length < 5){
//        // 默认1.5秒之后再消失
//        [hud hide:YES afterDelay:1.5f];
//    }else{
//        //阅读速度10字/3秒
//        [hud hide:YES afterDelay:text.length * 3.0 / 10.0];
//    }
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error" view:view];
}

/**
 *  显示提示信息
 *
 *  @param info 提示信息内容
 */
+ (void)showInfo:(NSString *)info {
    [self showInfo:info toView:nil];
}

/**
 *  显示提示信息
 *
 *  @param info 提示信息内容
 *  @param view 需要显示信息的视图
 */
+ (void)showInfo:(NSString *)info toView:(UIView *)view {
    [self show:info icon:@"info" view:view];
}

/**
 *  显示提示信息()
 *
 *  @param text 提示信息内容
 */
+ (void)showText:(NSString *)text {
    [self showText:text toView:nil];
}

/**
 *  显示提示信息
 *
 *  @param text 提示信息内容
 *  @param view 需要显示信息的视图
 */
+ (void)showText:(NSString *)text toView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
//    hud.labelText = text;
//    hud.yOffset = (hud.height - 64 - 49 - 60) / 2.0;
    hud.label.text = text;
    hud.offset = CGPointMake(hud.offset.x, (hud.height - 64 - 49 - 60) / 2.0);

    // 1秒之后再消失
//    [hud hide:YES afterDelay:1.0f];
    [hud hideAnimated:YES afterDelay:1.0f];

}

/**
 *  显示加载信息
 *
 *  @param message 信息内容
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message
{
    return [self showLoadingMessage:message toView:nil];
}

/**
 *  显示加载信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view {
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.labelText = message;
    hud.label.text = message;
    // YES代表需要蒙版效果
//    hud.dimBackground = YES;
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}


@end
