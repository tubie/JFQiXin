//
//  JFReweetStatusView.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFReweetStatusView.h"
#import "JFStatus.h"
#import "JFUser.h"
#import "JFStatusFrame.h"
#import "JFPhoto.h"
#import "JFPhotosView.h"

@interface JFReweetStatusView ()
/** 被转发说说作者的昵称 */
@property (nonatomic, weak) UILabel *retweetNameLabel;
/** 被转发说说的正文\内容 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 被转发说说的配图 */
@property (nonatomic, weak) JFPhotosView *retweetPhotosView;

@end
@implementation JFReweetStatusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_retweet_background" left:0.9 top:0.5];
        
        /** 2.被转发说说作者的昵称 */
        UILabel *retweetNameLabel = [[UILabel alloc] init];
        retweetNameLabel.font = IWRetweetStatusNameFont;
        retweetNameLabel.textColor = RGB(67, 107, 163);
        retweetNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:retweetNameLabel];
        self.retweetNameLabel = retweetNameLabel;
        
        /** 3.被转发说说的正文\内容 */
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = IWRetweetStatusContentFont;
        retweetContentLabel.backgroundColor = [UIColor clearColor];
        retweetContentLabel.numberOfLines = 0;
        retweetContentLabel.textColor = RGB(90, 90, 90);
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        /** 4.被转发说说的配图 */
        JFPhotosView *retweetPhotosView = [[JFPhotosView alloc] init];
        [self addSubview:retweetPhotosView];
        self.retweetPhotosView = retweetPhotosView;
    }
    return self;
}
- (void)setStatusFrame:(JFStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    JFStatus *retweetStatus = statusFrame.status.retweeted_status;
    JFUser *user = retweetStatus.user;
    
    // 1.昵称
    self.retweetNameLabel.text = [NSString stringWithFormat:@"@%@", user.name];
    self.retweetNameLabel.frame = self.statusFrame.retweetNameLabelF;
    
    // 2.正文
    self.retweetContentLabel.text = retweetStatus.text;
    self.retweetContentLabel.frame = self.statusFrame.retweetContentLabelF;
    
    // 3.配图
    if (retweetStatus.pic_urls.count) {
        self.retweetPhotosView.hidden = NO;
        self.retweetPhotosView.frame = self.statusFrame.retweetPhotosViewF;
        self.retweetPhotosView.photos = retweetStatus.pic_urls;
    } else {
        self.retweetPhotosView.hidden = YES;
    }
}



@end
