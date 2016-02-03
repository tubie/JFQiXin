//
//  JFPhotoView.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFPhotoView.h"
#import "JFPhoto.h"

@interface JFPhotoView ()
@property (nonatomic, weak) UIImageView *gifView;


@end
@implementation JFPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个GIF小图片
        UIImage *image = [UIImage imageWithName:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

- (void)setPhoto:(JFPhoto *)photo
{
    _photo = photo;
    
    /*模型转字典*/
    NSDictionary *phonoDict = [photo keyValues];
    // 控制gifView的可见性
    self.gifView.hidden = ![phonoDict[@"thumbnail_pic"] hasSuffix:@"gif"];
    
    
//    // 下载图片
//    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
//
  
 [self sd_setImageWithURL:[NSURL URLWithString:phonoDict[@"thumbnail_pic"]] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
