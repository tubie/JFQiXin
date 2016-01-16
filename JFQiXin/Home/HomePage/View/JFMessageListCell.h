//
//  JFMessageListCell.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/25.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFMessageListModel;
@interface JFMessageListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentNameLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMessageListModel *messageListModel;


@end
