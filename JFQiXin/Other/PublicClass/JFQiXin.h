//
//  JFQiXin.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/23.
//  Copyright © 2015年 JF. All rights reserved.
//

#ifndef JFQiXin_h
#define JFQiXin_h

//设备的宽高
#define JFSCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define JFSCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44
//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define navigationBarColor RGB(6, 190, 4)
#define separaterColor RGB(200, 199, 204)

#define     DEFAULT_NAVBAR_COLOR             RGBA(20.0, 20.0, 20.0, 0.9)
#define     DEFAULT_BACKGROUND_COLOR         RGBA(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_SEARCHBAR_COLOR          RGBA(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_NAVBAR_COLOR             RGBA(20.0, 20.0, 20.0, 0.9)

//字体
#define kFONT16                  [UIFont systemFontOfSize:16.0f]
#define kFONT15                  [UIFont systemFontOfSize:15.0f]
#define kFONT12                  [UIFont systemFontOfSize:12.0f]
#define kFONT10                  [UIFont systemFontOfSize:10.0f]


#define kX(a)             CGRectGetMinX(a.frame)//(v).frame.origin.x
#define kY(a)             CGRectGetMinY(a.frame)//(v).frame.origin.y
#define kXW(a)            CGRectGetMaxX(a.frame)//(v).frame.origin.x + (v).frame.size.width
#define kYH(a)            CGRectGetMaxY(a.frame)//(v).frame.origin.y + (v).frame.size.height
#define kWIDTH(a)         CGRectGetWidth(a.frame)//(v).frame.size.width
#define kHEIGHT(a)        CGRectGetHeight(a.frame)//(v).frame.size.height

//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


//搜索文件
#define JFSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]

#import "UITableView+JFTableView.h"
#import "UIBarButtonItem+JFBarButtonItem.h"
#import <RESideMenu.h>
#import "JFNavigationController.h"
#import "AFNetworking.h"
#import "UIView+JFExtention.h"
//#import "NetWork.h"
//#import "GetPlistArray.h"
//#import "GetUrlString.h"
//#import "UIView+JFLoadXib.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "JFViewController.h"
#import "UIImage+JF.h"
#endif /* JFQiXin_h */
