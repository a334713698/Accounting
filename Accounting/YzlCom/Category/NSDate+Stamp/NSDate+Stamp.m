//
//  NSDate+Stamp.m
//  Indiana
//
//  Created by irene on 16/4/7.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import "NSDate+Stamp.h"

@implementation NSDate (Stamp)

/**
 *  时间转换成时间戳
 *
 *  @return 时间戳
 */
- (NSString *)dateToTimeStamp {
    return [NSString stringWithFormat:@"%lf", [self timeIntervalSince1970]];
}

/**
 *  时间戳转换成当前时间
 *
 *  @param timeStamp 时间戳
 *
 *  @return 当前时间
 */

+ (NSDate *)timeStampToDateWithTimeStamp:(id)timeStamp {
    NSString *arg = timeStamp;
    
    if (![timeStamp isKindOfClass:[NSString class]]) {
        arg = [NSString stringWithFormat:@"%@", timeStamp];
    }
    
    NSTimeInterval time = [arg doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:time];
    //    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //    return [date dateByAddingTimeInterval:interval];
}

//当前时间转换成分钟字符串
+ (NSString *)dateToMinuteString:(NSDate *)date{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式:zzzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    //NSDate转成NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

//当前时间转换成分钟字符串
+ (NSString *)dateTodateString:(NSDate *)date{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式:zzzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate转成NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

/**
 *  当前时间转成字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

/**
 *  当前时间转成字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToYYMMDDWeekHHMMString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEEE HH:mm"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

/**
 *  当前时间转成字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToYYMMDDWeekString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy/MM/dd EEEE"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

+ (NSString *)dateToYYMMDDLineWeekString:(NSDate *)date  {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEEE"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}


/**
 *  当前时间转成毫秒字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToMsecString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

/**
 *  当前时间转成年月字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToYYMMDDString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy年M月dd日"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

/**
 *  当前时间转成年月字符串
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToYYMMDDHHWithLineString:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

#pragma mark - 私有
+ (NSString *)dateToStringWithDateFormatterStr:(NSString *)dateFormatterStr withDate:(NSDate *)date {
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:dateFormatterStr];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    //输出currentDateString
    return currentDateString;
}

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

#pragma mark - methods

/**
 *  转换成昨天，今天，明天字符串
 *
 *  @param date 当前日期
 *
 *  @return 字符串形式
 */
+ (NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString]) {
        return [NSString stringWithFormat:@"%@",[[NSDate dateToString:date] substringWithRange:NSMakeRange(10, 6)]];
    } else if ([dateString isEqualToString:yesterdayString]) {
        return [NSString stringWithFormat:@"昨天%@",[[NSDate dateToString:date] substringWithRange:NSMakeRange(10, 6)]];
    }else if ([dateString isEqualToString:tomorrowString]) {
        return [NSString stringWithFormat:@"明天%@",[[NSDate dateToString:date] substringWithRange:NSMakeRange(10, 6)]];
    } else {
        return [[NSDate dateToString:date] substringToIndex:10];
    }
}

/**
 *  将秒数转换成xx:xx:xx格式
 *
 *  @param sec 秒数
 *
 *  @return 字符串形式
 */
+ (NSString *)transformTimeSecondsToTimeStrWithTimeSeconds:(CGFloat)sec {
    long minute = sec / 60;
    long seconds = (long)sec % 60;
    long mseconds = (sec - minute * 60 - seconds) * 100;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",minute,seconds,mseconds];
}

/**
 *  将xx:xx:xx格式转换成秒数
 *
 *  @param str xx:xx:xx
 *
 *  @return 秒数
 */
+ (CGFloat)transformTimeStrToTimeSecondsWithTimeSeconds:(NSString *)str {
    NSArray *arr = [str componentsSeparatedByString:@":"];
    CGFloat s = 0.0;
    for (int i = 0; i < arr.count; i++) {
        CGFloat temp = [arr[i] integerValue];
        if (i == 0) {
            s += temp * 60.0;
        }else if (i == 1) {
            s += temp;
        }else {
            s += temp / 100.0;
        }
    }
    return s;
}

+ (NSString *)transFormTimeStampToTodayTimeStr:(id)timeStamp {
    NSString *ret = @"";
    // 获取当前时时间戳
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 给定时间戳
    NSTimeInterval createTime = [timeStamp doubleValue] / 1000;
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    //秒转分
    NSInteger minutes = time/60;
    // 秒转小时
    NSInteger hours = time/3600;
    if (minutes == 0) {
        ret = @"刚刚";
    }else if (minutes < 60) {
        ret = [NSString stringWithFormat:@"%ld分钟前",minutes];
    }else if (hours < 24) {
        ret = [NSString stringWithFormat:@"%ld小时前",hours];
    }else{
        ret = [NSDate dateTodateString:[NSDate timeStampToDateWithTimeStamp:@(createTime)]];
    }
    return ret;
}

+ (NSString *)transFormTimeStampInTodayTimeWithHHMMStr:(NSDate *)date {
    NSTimeInterval secondsPerSec = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    //转成当前时区的时间
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerSec];
    yesterday = [today dateByAddingTimeInterval: -secondsPerSec];
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
//    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString]) {//今天
//        return [NSString stringWithFormat:@"今天%@",[[NSDate dateToString:date] substringWithRange:NSMakeRange(10, 6)]];
        return [self dateToStringWithDateFormatterStr:@"HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    } else if ([dateString isEqualToString:yesterdayString]) {//昨天
        return @"昨天";
    }else {//昨天之前
        return [self dateToStringWithDateFormatterStr:@"MM月dd日" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    }
    
    
    
//    NSString *ret = @"";
//    // 获取当前时时间戳
//    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
//    // 给定时间戳
//    NSTimeInterval createTime = [timeStamp doubleValue] / 1000;
//    // 时间差
//    NSTimeInterval time = currentTime - createTime;
//    //秒转分
////    NSInteger minutes = time/60;
//    // 秒转小时
//    NSInteger hours = time/3600;
//    if (hours < 24) {
//        ret = [self dateToStringWithDateFormatterStr:@"HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@(createTime)]];
//    }else{
//        ret = [NSDate dateTodateString:[NSDate timeStampToDateWithTimeStamp:@(createTime)]];
//    }
//    return ret;
}

/**
 *  当前时间参数转成自定义时间格式
 *
 *  @param date 当前时间
 *
 *  @return 字符串形式
 */
+ (NSString *)dateToCustomString:(NSDate *)date andDateFormat:(NSString*)format{
        //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设置格式：zzz表示时区
    [dateFormatter setDateFormat:format];
        //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
        //输出currentDateString
    return currentDateString;
}

//传入格式和字符串，转换成Date
+ (NSDate *)stringToDateWithDateFormatterStr:(NSString *)dateFormatterStr withDateStr:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatterStr];
    NSDate *destDate= [dateFormatter dateFromString:dateStr];
    return destDate;
}

//传入格式和字符串，转换成时间戳
+ (NSString*)stringToTimeStampWithDateFormatterStr:(NSString *)dateFormatterStr withDateStr:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatterStr];
    NSDate *destDate= [dateFormatter dateFromString:dateStr];
    return [NSString stringWithFormat:@"%.0lf",[destDate timeIntervalSince1970] * 1000];
}


/**
 *  语音聊天界面的时间显示
 *
 */
+ (NSString *)transFormTimeStampForVoiceReplyWithHHMMStr:(NSDate *)date {
    NSTimeInterval secondsPerSec = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
        //转成当前时区的时间
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerSec];
    yesterday = [today dateByAddingTimeInterval: -secondsPerSec];

    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];

    NSString * dateString = [[date description] substringToIndex:10];
    
    
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    NSInteger todayWeekNum = [calendar1 ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:today];
    NSInteger dateWeekNum = [calendar1 ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:date];


    if ([dateString isEqualToString:todayString]) {//今天
        return [self dateToStringWithDateFormatterStr:@"HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    } else if ([dateString isEqualToString:yesterdayString]) {//昨天
        return [self dateToStringWithDateFormatterStr:@"昨天 HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    } else if (todayWeekNum == dateWeekNum) {//本周
        return [self dateToStringWithDateFormatterStr:@"EEEE HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    }else {//其他
        return [self dateToStringWithDateFormatterStr:@"yyyy年MM月dd日 HH:mm" withDate:[NSDate timeStampToDateWithTimeStamp:@([date timeIntervalSince1970])]];
    }
    
}


@end
