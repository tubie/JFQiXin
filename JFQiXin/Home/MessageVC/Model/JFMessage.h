//
//  JFMessage.h
//  baoxiu51
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

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
