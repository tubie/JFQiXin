//
//  JFMessage.h
//  baoxiu51
//
//  Created by 保修一站通 on 15/7/20.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFMessage : NSObject
typedef enum {
    JFMessageTypeMe = 0, // 自己发的
    JFMessageTypeOther   // 别人发的
} MJMessageType;

/**
 *  聊天内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  发送时间
 */
@property (nonatomic, copy) NSString *time;
/**
 *  信息的类型
 */
@property (nonatomic, assign) MJMessageType type;

/**
 *  是否隐藏时间
 */
@property (nonatomic, assign) BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
