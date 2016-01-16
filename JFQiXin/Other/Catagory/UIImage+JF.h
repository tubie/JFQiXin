//
//  UIImage+JF.h
//  JFQiXin
//
//  Created by jianfanglin on 15/12/30.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JF)
+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;




@end
