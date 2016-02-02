//
//  JFAddressBookHeaderView.m
//  JFQiXin
//
//  Created by jianfanglin on 16/2/2.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFAddressBookHeaderView.h"

@implementation JFAddressBookHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFAddressBookHeaderView";
    JFAddressBookHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFAddressBookHeaderView" owner:nil options:nil] lastObject];
        
    }
    
    return headView;
}

@end
