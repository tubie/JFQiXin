//
//  JFCustomerServiceCenterCell.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFCustomerServiceCenterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *listLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
