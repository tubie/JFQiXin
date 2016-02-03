//
//  JFStatusFrame.h
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <Foundation/Foundation.h>

/** 昵称的字体 */
#define IWStatusNameFont [UIFont systemFontOfSize:15]
/** 被转发说说作者昵称的字体 */
#define IWRetweetStatusNameFont IWStatusNameFont

/** 时间的字体 */
#define IWStatusTimeFont [UIFont systemFontOfSize:12]
/** 来源的字体 */
#define IWStatusSourceFont IWStatusTimeFont

/** 正文的字体 */
#define IWStatusContentFont [UIFont systemFontOfSize:13]
/** 被转发说说正文的字体 */
#define IWRetweetStatusContentFont IWStatusContentFont

/** 表格的边框宽度 */
#define IWStatusTableBorder 5

/** cell的边框宽度 */
#define IWStatusCellBorder 10

@class JFStatus;
@interface JFStatusFrame : NSObject
@property(nonatomic, strong)JFStatus *status;

/** 顶部的view */
@property (nonatomic, assign, readonly) CGRect topViewF;
/** 头像 */
@property (nonatomic, assign, readonly) CGRect iconViewF;
/** 会员图标 */
@property (nonatomic, assign, readonly) CGRect vipViewF;
/** 配图 */
@property (nonatomic, assign, readonly) CGRect photosViewF;
/** 昵称 */
@property (nonatomic, assign, readonly) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign, readonly) CGRect timeLabelF;
/** 来源 */
@property (nonatomic, assign, readonly) CGRect sourceLabelF;
/** 正文\内容 */
@property (nonatomic, assign, readonly) CGRect contentLabelF;

/** 被转发说说的view(父控件) */
@property (nonatomic, assign, readonly) CGRect retweetViewF;
/** 被转发说说作者的昵称 */
@property (nonatomic, assign, readonly) CGRect retweetNameLabelF;
/** 被转发说说的正文\内容 */
@property (nonatomic, assign, readonly) CGRect retweetContentLabelF;
/** 被转发说说的配图 */
@property (nonatomic, assign, readonly) CGRect retweetPhotosViewF;

/** 说说的工具条 */
@property (nonatomic, assign, readonly) CGRect statusToolbarF;

/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;


@end
