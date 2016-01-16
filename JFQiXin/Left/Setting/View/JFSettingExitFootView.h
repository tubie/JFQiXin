//
//  JFSettingExitFootView.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFSettingExitFootView : UITableViewHeaderFooterView

- (IBAction)exitClick:(id)sender;

+ (instancetype)footViewWithTableView:(UITableView *)tableView;

@end
