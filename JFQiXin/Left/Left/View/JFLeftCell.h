//
//  JFLeftCell.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/22.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFLeftCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet UILabel *leftTitleLabel;


@end
