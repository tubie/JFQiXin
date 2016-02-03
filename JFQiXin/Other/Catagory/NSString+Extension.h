//
//  NSString+Extension.h
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  给定一个字符串隐藏部分然后重新拼接后返回
 */
-(NSString *)hindPartOfString:(NSString *)string;

- (NSString *) pinyin;
- (NSString *) pinyinInitial;
@end
