//
//  JFStatus.h
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <Foundation/Foundation.h>
@class JFUser;
@interface JFStatus : NSObject

/**
 *  说说的内容(文字)
 */
@property (nonatomic, copy) NSString *text;
/**
 *  说说的来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  说说的时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  说说的ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  说说的配图(数组中装模型:IWPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;

//@property (nonatomic, copy) NSString *thumbnail_pic;

/**
 *  说说的转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  说说的评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  说说的表态数(被赞数)
 */
@property (nonatomic, assign) int attitudes_count;
/**
 *  说说的作者
 */
@property (nonatomic, strong) JFUser *user;
/**
 *  被转发的说说
 */
@property (nonatomic, strong) JFStatus *retweeted_status;

@end
