//
//  JFMessageFrame.m
//  baoxiu51
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFMessageFrame.h"
#import "JFMessage.h"
#import "NSString+Extension.h"

@implementation JFMessageFrame
- (void)setMessage:(JFMessage *)message
{
    _message = message;
    // 间距
    CGFloat padding = 10;
    // 屏幕的宽度
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    // 1.时间
    if (message.hideTime == NO) { // 显示时间
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = screenW;
        CGFloat timeH = 40;
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 2.头像
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconX;
    if (message.type == JFMessageTypeOther) {// 别人发的
        iconX = padding;
    } else { // 自己的发的
        iconX = screenW - padding - iconW;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 3.正文
    CGFloat textY = iconY;
    // 文字计算的最大尺寸
    CGSize textMaxSize = CGSizeMake(200, MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize textRealSize = [message.text sizeWithFont:JFTextFont maxSize:textMaxSize];
    // 按钮最终的真实尺寸
    CGSize textBtnSize = CGSizeMake(textRealSize.width + JFTextPadding * 2, textRealSize.height + JFTextPadding * 2);
    CGFloat textX;
    if (message.type == JFMessageTypeOther) {// 别人发的
        textX = CGRectGetMaxX(_iconF) + padding;
    } else {// 自己的发的
        textX = iconX - padding - textBtnSize.width;
    }
    //    _textF = CGRectMake(textX, textY, textSize.width + 40, textSize.height + 40);
    _textF = (CGRect){{textX, textY}, textBtnSize};
    
    // 4.cell的高度
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    _cellHeight = MAX(textMaxY, iconMaxY) + padding;
}


@end
