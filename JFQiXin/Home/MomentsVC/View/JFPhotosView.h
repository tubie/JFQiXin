//
//  JFPhotosView.h
//  JFQiXin
//
//  Created by jianfanglin on 15/12/30.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFPhotosView : UIView
/**
 *  需要展示的图片(数组里面装的都是IWPhoto模型)
 */
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotosCount:(int)count;

@end
