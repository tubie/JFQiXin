//
//  JFAddressBookHeadView.m
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFAddressBookHeadView.h"

@implementation JFAddressBookHeadView


+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFAddressBookHeadView";
    JFAddressBookHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
        
    }
    return headView;
}

@end
