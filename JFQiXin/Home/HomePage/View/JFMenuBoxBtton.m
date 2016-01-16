//
//  JFMenuBoxBtton.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/23.
//  Copyright © 2015年 JF. All rights reserved.
//

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
