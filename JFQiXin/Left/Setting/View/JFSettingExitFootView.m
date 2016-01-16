//
//  JFSettingExitFootView.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFSettingExitFootView.h"

@implementation JFSettingExitFootView


- (IBAction)exitClick:(id)sender {
}

+ (instancetype)footViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"JFSettingExitFootView";
    JFSettingExitFootView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFSettingExitFootView" owner:nil options:nil] lastObject];
    }
    
    return headView;
}

@end
