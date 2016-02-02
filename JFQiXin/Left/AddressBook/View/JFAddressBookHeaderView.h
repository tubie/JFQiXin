//
//  JFAddressBookHeaderView.h
//  JFQiXin
//
//  Created by jianfanglin on 16/2/2.
//  Copyright © 2016年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAddressBookHeaderView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *keyTitleLabel;

+ (instancetype)headViewWithTableView:(UITableView *)tableView;


@end
