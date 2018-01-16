//
//  YZLConfig.h
//  mall
//
//  Created by irene on 16/3/9.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#ifndef YZLConfig_h
#define YZLConfig_h

// 服务器地址
#define API_URL @""

#define API_UPLOAD_URL @""
// 服务器网页地址
#define WEB_URL @""

// 尺寸宏
#define STATUSBAR_HEIGHT 20
#define NAVIGATIONBAR_HEIGHT 44
#define NavigationBarIcon 20
#define TABBAR_HEIGHT 49
#define TabBarIcon 30
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// 打印宏
//替换NSLog来使用，debug模式下可以打印很多方法名，行信息。
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


// 自适应设备宽度
#define adaptWidth(w) SCREEN_WIDTH / 375 * (w)
// 自适应设备高度
#define adaptHeight(h) SCREEN_HEIGHT / 667 * (h)
// 字体大小自适应
#define adaptFont(font) SCREEN_WIDTH / 375 * (font) < 12.0f ? 12.0f : SCREEN_WIDTH / 375 * (font)
//屏幕window
#define WINDOW [UIApplication sharedApplication].keyWindow


// 系统宏
// 获取版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
// 获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
// iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
// iPhone Simulator
#endif


//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


// 图片宏
// 读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
// 定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]


// 颜色宏
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// 背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]
// 状态栏,导航栏背景色
#define STATUSBAR_BACKGROUND_COLOR [UIColor colorWithRed:246.0/255.0 green:36.0/255.0 blue:89.0/255.0 alpha:1.0]
#define NAVBAR_BACKGROUND_COLOR [UIColor colorWithRed:246.0/255.0 green:36.0/255.0 blue:89.0/255.0 alpha:1.0]
#define BUTTON_BACKGROUND_COLOR [UIColor colorWithRed:246.0/255.0 green:36.0/255.0 blue:89.0/255.0 alpha:1.0]
#define PROGRESS_TRACKTINT_COLOR [UIColor colorWithRed:246.0/255.0 green:36.0/255.0 blue:89.0/255.0 alpha:0.2]
    // 红色
#define RED_COLOR [UIColor colorWithRed:246.0/255.0 green:36.0/255.0 blue:89.0/255.0 alpha:1.0]
    // 黄色
#define YELLOW_COLOR [UIColor colorWithRed:250.0/255.0 green:255.0/255.0 blue:197.0/255.0 alpha:1.0]
    // 蓝色
#define BLUE_COLOR [UIColor colorWithRed:42.0/255.0 green:139.0/255.0 blue:254.0/255.0 alpha:1.0]
    // 黑色
#define BLACK_COLOR [UIColor blackColor]
    // 灰色
#define GRAY_COLOR [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]
    // 主色
#define MAIN_COLOR [UIColor colorWithRed:0/255.0 green:180/255.0 blue:235/255.0 alpha:1.0]
    // 清除背景色
#define CLEARCOLOR [UIColor clearColor]
    // 线条默认颜色
#define LINE_BACKGROUND_COLOR  [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0]
    // 字体默认颜色
#define TEXT_BACKGROUND_COLOR  [UIColor colorWithRed:101.0/255.0 green:101.0/255.0 blue:101.0/255.0 alpha:1.0]
#define TEXT_BACKGROUND_COLOR_LIGHT  [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0]
// 字体颜色-白色
#define WHITE_COLOR [UIColor whiteColor]
// 线条-白色
#define LINE_WHITE_COLOR [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5]
    // 线条颜色
#define LINE_COLOR [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:227.0/255.0 alpha:1.0]
#define LINE_COLOR_GRAY_DARK [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0]
#define LINE_COLOR_GRAY_LIGHT [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0]


// NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

// 默认缓存路径
#define CACHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 底部线条视图
#define LINEVIEW(classname,y,height,view) \
UIView *classname = [[UIView alloc] initWithFrame:CGRectMake(0, y - height, SCREEN_WIDTH, height)]; \
classname.backgroundColor = LINE_BACKGROUND_COLOR; \
[view addSubview:classname]; \

//移除iOS7之后，cell默认左侧的分割线边距
#define removeCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\


// 单例宏
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}


#endif /* YZLConfig_h */
