//
//  JFAddressBookHeadView.h
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAddressBookHeadView : UITableViewHeaderFooterView
@property(nonatomic, copy)NSString *keyStr;

+ (instancetype)headViewWithTableView:(UITableView *)tableView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
