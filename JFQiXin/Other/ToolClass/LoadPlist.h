//
//  LoadPlist.h
//  JFQiXin
//
//  Created by jianfanglin on 15/12/30.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadPlist : NSObject
/*
 * 加载plist文件
 */
+(NSDictionary *)loadPlistFromPlistName:(NSString *)name;


@end
