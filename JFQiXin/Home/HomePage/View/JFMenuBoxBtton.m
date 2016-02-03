//
//  JFMenuBoxBtton.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFMenuBoxBtton.h"

@implementation JFMenuBoxBtton

-(void)layoutSubviews{
    
    
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = imageW;
    self.imageView.frame = CGRectMake(0, 0, imageW, imageH);
    
    CGFloat titleY = imageH;
    CGFloat titleW = imageW;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(0, titleY, titleW, titleH);
    


}

@end
