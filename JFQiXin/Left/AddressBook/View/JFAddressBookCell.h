//
//  JFAddressBookCell.h
//  JFQiXin
//
//  Created by jianfanglin on 16/2/2.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFAddressBookModel;
@interface JFAddressBookCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property(nonatomic, strong)JFAddressBookModel *addressBookModel;

@end
