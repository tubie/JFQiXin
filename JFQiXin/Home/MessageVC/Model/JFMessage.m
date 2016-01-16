//
//  JFMessage.m
//  baoxiu51
//
//  Created by 保修一站通 on 15/7/20.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import "JFMessage.h"

@implementation JFMessage
+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}



@end
