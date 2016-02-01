//
//  JFAddressBookCell.h
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFUserModel;
@interface JFAddressBookCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFUserModel *userModel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end
