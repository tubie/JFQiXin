//
//  JFHomeTaskCell.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/22.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFHomeTaskCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *taskImageView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
