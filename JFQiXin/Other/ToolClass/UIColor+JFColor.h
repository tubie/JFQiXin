//
//  UIColor+JFColor.h
//  JFCalendarPicker
//
//  Created by 保修一站通 on 15/10/1.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JFColor)
+ (UIColor *)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 *  16进制转uicolor
 *
 *  @param color @"#FFFFFF" ,@"OXFFFFFF" ,@"FFFFFF"
 *
 *  @return uicolor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


@end
