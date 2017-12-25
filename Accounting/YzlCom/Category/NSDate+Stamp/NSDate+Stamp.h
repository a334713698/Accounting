//
//  NSDate+Stamp.h
//  Indiana
//
//  Created by irene on 16/4/7.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Stamp)
// 时间转换成时间戳
- (NSString *)dateToTimeStamp;
// 时间戳转换成当前时间
+ (NSDate *)timeStampToDateWithTimeStamp:(id)timeStamp;
//当前时间转成分钟字符串
+ (NSString *)dateToMinuteString:(NSDate *)date;
//当前时间转成日期字符串
+ (NSString *)dateTodateString:(NSDate *)date;
// 当前时间转成秒字符串
+ (NSString *)dateToString:(NSDate *)date;
// 当前时间转成含有年月日星期时间的字符串
+ (NSString *)dateToYYMMDDWeekHHMMString:(NSDate *)date;
// 当前时间转成含有年月日星期的字符串
+ (NSString *)dateToYYMMDDWeekString:(NSDate *)date;
// 当前时间转成含有年月日星期分割线连接的字符串
+ (NSString *)dateToYYMMDDLineWeekString:(NSDate *)date;
// 当前时间转成毫秒字符串
+ (NSString *)dateToMsecString:(NSDate *)date;
// 当前时间转成年月字符串
+ (NSString *)dateToYYMMDDString:(NSDate *)date;
// 当前时间转成年月字符串（加斜线）
+ (NSString *)dateToYYMMDDHHWithLineString:(NSDate *)date;
// 当前时间转换成昨天，今天，明天字符串
+ (NSString *)compareDate:(NSDate *)date;
// 将秒数转换成xx:xx:xx格式
+ (NSString *)transformTimeSecondsToTimeStrWithTimeSeconds:(CGFloat)sec;
// 将xx:xx:xx格式转换成秒数
+ (CGFloat)transformTimeStrToTimeSecondsWithTimeSeconds:(NSString *)str;
// 将时间戳格式转换成 今天以内 几分钟、小时前 否则显示日期
+ (NSString *)transFormTimeStampToTodayTimeStr:(id)timeStamp;

// 将时间戳格式转换成 今天以内 xx:xx 否则显示日期
+ (NSString *)transFormTimeStampInTodayTimeWithHHMMStr:(NSDate *)date;

// 当前时间自定义时间格式
+ (NSString *)dateToCustomString:(NSDate *)date andDateFormat:(NSString*)format;

//传入格式和字符串，转换成Date
+ (NSDate *)stringToDateWithDateFormatterStr:(NSString *)dateFormatterStr withDateStr:(NSString *)dateStr;
//传入格式和字符串，转换成时间戳
+ (NSString*)stringToTimeStampWithDateFormatterStr:(NSString *)dateFormatterStr withDateStr:(NSString *)dateStr;

/**  语音聊天界面的时间显示 */
+ (NSString *)transFormTimeStampForVoiceReplyWithHHMMStr:(NSDate *)date;

@end
