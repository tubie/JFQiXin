//
//  JFMessageCell.h
//  baoxiu51
//
//  Created by 保修一站通 on 15/7/20.
//  Copyright (c) 2015年 baoxiuyizhantong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMessageFrame;

@interface JFMessageCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) JFMessageFrame *messageFrame;


@end
