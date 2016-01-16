//
//  NSString+Extension.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


-(NSString *)hindPartOfString:(NSString *)string{
    
    NSString *temp = nil;
    NSMutableString *mutableString = [[NSMutableString alloc]init];
    NSMutableArray *array = [NSMutableArray array];
    for(int i =0; i < [string length]; i++)
    {
        temp = [string substringWithRange:NSMakeRange(i, 1)];
        if (![self isPureInt:temp]) {
            NSString *mutableString2 =  [mutableString stringByAppendingString:temp];
            [array addObject:mutableString2];
        }else{
            NSString *starStr =  [temp stringByReplacingOccurrencesOfString:temp withString:@"*"];
            [array addObject:starStr];
            
        }
    }
    return [array componentsJoinedByString:@""];//拼接数组里面的字符串

}
//判断是否是整数
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}



@end