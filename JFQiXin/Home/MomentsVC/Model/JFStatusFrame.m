//
//  JFStatusFrame.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFStatusFrame.h"
#import "JFStatus.h"
#import "JFUser.h"
#import "JFPhotosView.h"
@implementation JFStatusFrame

/**
 *  获得微博模型数据之后, 根据微博数据计算所有子控件的frame
 */
- (void)setStatus:(JFStatus *)status
{
    _status = status;
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2 * IWStatusTableBorder;
    
    // 1.topView
    CGFloat topViewW = cellW;
    CGFloat topViewH = 0;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    
    // 2.头像
    CGFloat iconViewWH = 35;
    CGFloat iconViewX = IWStatusCellBorder;
    CGFloat iconViewY = IWStatusCellBorder;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    
    /*
     * NSString *text = ...;
     CGFloat width = ...;
     UIFont *font = ...;
     NSAttributedString *attributedText =
     [[NSAttributedString alloc] initWithString:text
     attributes:@{NSFontAttributeName: font}];
     CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
     options:NSStringDrawingUsesLineFragmentOrigin
     context:nil];
     CGSize size = rect.size;
     **/
    
    
    // 3.昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + IWStatusCellBorder;
    CGFloat nameLabelY = iconViewY;
    CGSize nameLabelSize = [status.user.name sizeWithFont:IWStatusNameFont];
    _nameLabelF = (CGRect){{nameLabelX, nameLabelY}, nameLabelSize};
    
    // 4.会员图标
    if (status.user.mbtype) {
        CGFloat vipViewW = 14;
        CGFloat vipViewH = nameLabelSize.height;
        CGFloat vipViewX = CGRectGetMaxX(_nameLabelF) + IWStatusCellBorder;
        CGFloat vipViewY = nameLabelY;
        _vipViewF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    }
    
    // 5.时间
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF) + IWStatusCellBorder * 0.5;
    //@{NSFontAttributeName : [UIFont systemFontOfSize:17]}
//    CGSize timeLabelSize = [status.created_at sizeWithFont:IWStatusTimeFont];
    CGSize timeLabelSize = [status.created_at sizeWithFont:IWStatusTimeFont];

    _timeLabelF = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    
    // 6.来源
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabelF) + IWStatusCellBorder;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [status.source sizeWithFont:IWStatusSourceFont];
    _sourceLabelF = (CGRect){{sourceLabelX, sourceLabelY}, sourceLabelSize};
    
    // 7.微博正文内容
    CGFloat contentLabelX = iconViewX;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_timeLabelF), CGRectGetMaxY(_iconViewF)) + IWStatusCellBorder * 0.5;
    CGFloat contentLabelMaxW = topViewW - 2 * IWStatusCellBorder;
    CGSize contentLabelSize = [status.text sizeWithFont:IWStatusContentFont constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
    
    _contentLabelF = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize};
    
    // 8.配图
    if (status.pic_urls.count) {
#warning 根据图片个数计算整个相册的尺寸
        CGSize photosViewSize = [JFPhotosView photosViewSizeWithPhotosCount:status.pic_urls.count];
        CGFloat photosViewX = contentLabelX;
        CGFloat photosViewY = CGRectGetMaxY(_contentLabelF) + IWStatusCellBorder;
        _photosViewF = CGRectMake(photosViewX, photosViewY, photosViewSize.width, photosViewSize.height);
    }
    
    // 9.被转发微博
    if (status.retweeted_status) {
        CGFloat retweetViewW = contentLabelMaxW;
        CGFloat retweetViewX = contentLabelX;
        CGFloat retweetViewY = CGRectGetMaxY(_contentLabelF) + IWStatusCellBorder * 0.5;
        CGFloat retweetViewH = 0;
        
        // 10.被转发微博的昵称
        CGFloat retweetNameLabelX = IWStatusCellBorder;
        CGFloat retweetNameLabelY = IWStatusCellBorder;
        NSString *name = [NSString stringWithFormat:@"@%@", status.retweeted_status.user.name];
        CGSize retweetNameLabelSize = [name sizeWithFont:IWRetweetStatusNameFont];
        _retweetNameLabelF = (CGRect){{retweetNameLabelX, retweetNameLabelY}, retweetNameLabelSize};
        
        // 11.被转发微博的正文
        CGFloat retweetContentLabelX = retweetNameLabelX;
        CGFloat retweetContentLabelY = CGRectGetMaxY(_retweetNameLabelF) + IWStatusCellBorder * 0.5;
        CGFloat retweetContentLabelMaxW = retweetViewW - 2 * IWStatusCellBorder;
        CGSize retweetContentLabelSize = [status.retweeted_status.text sizeWithFont:IWRetweetStatusContentFont constrainedToSize:CGSizeMake(retweetContentLabelMaxW, MAXFLOAT)];
        _retweetContentLabelF = (CGRect){{retweetContentLabelX, retweetContentLabelY}, retweetContentLabelSize};
        
        // 12.被转发微博的配图
        if(status.retweeted_status.pic_urls.count) {
#warning 根据图片个数计算整个相册的尺寸
            CGSize retweetPhotosViewSize = [JFPhotosView photosViewSizeWithPhotosCount:status.retweeted_status.pic_urls.count];
            CGFloat retweetPhotosViewX = retweetContentLabelX;
            CGFloat retweetPhotosViewY = CGRectGetMaxY(_retweetContentLabelF) + IWStatusCellBorder;
            _retweetPhotosViewF = CGRectMake(retweetPhotosViewX, retweetPhotosViewY, retweetPhotosViewSize.width, retweetPhotosViewSize.height);
            
            retweetViewH = CGRectGetMaxY(_retweetPhotosViewF);
        } else { // 没有配图
            retweetViewH = CGRectGetMaxY(_retweetContentLabelF);
        }
        retweetViewH += IWStatusCellBorder;
        _retweetViewF = CGRectMake(retweetViewX, retweetViewY, retweetViewW, retweetViewH);
        
        // 有转发微博时topViewH
        topViewH = CGRectGetMaxY(_retweetViewF);
    } else { // 没有转发微博
        if (status.pic_urls.count) { // 有图
            topViewH = CGRectGetMaxY(_photosViewF);
        } else { // 无图
            topViewH = CGRectGetMaxY(_contentLabelF);
        }
    }
    topViewH += IWStatusCellBorder;
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    // 13.工具条
    CGFloat statusToolbarX = topViewX;
    CGFloat statusToolbarY = CGRectGetMaxY(_topViewF);
    CGFloat statusToolbarW = topViewW;
    CGFloat statusToolbarH = 35;
    _statusToolbarF = CGRectMake(statusToolbarX, statusToolbarY, statusToolbarW, statusToolbarH);
    
    // 14.cell的高度
    _cellHeight = CGRectGetMaxY(_statusToolbarF) + IWStatusTableBorder;
}

@end
