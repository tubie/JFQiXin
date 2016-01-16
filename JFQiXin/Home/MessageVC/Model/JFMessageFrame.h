//
//  JFMessageFrame.h
//  baoxiu51
//
//  Created by 保修一站通 on 15/7/20.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

// 正文的字体
#define JFTextFont [UIFont systemFontOfSize:15]

// 正文的内边距
#define JFTextPadding 20
#import <Foundation/Foundation.h>
@class JFMessage;

@interface JFMessageFrame : NSObject
/**
 *  头像的frame
 */
@property (nonatomic, assign, readonly) CGRect iconF;
/**
 *  时间的frame
 */
@property (nonatomic, assign, readonly) CGRect timeF;
/**
 *  正文的frame
 */
@property (nonatomic, assign, readonly) CGRect textF;
/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic, strong) JFMessage *message;

@end
