//
//  UIImage+Extension.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 *  返回一张可以随意拉伸不变形的图片
 *
 *  @param name 图片名字
 */
+ (UIImage *)resizableImage:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
   // return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
    return  [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeTile];
    
}
@end
