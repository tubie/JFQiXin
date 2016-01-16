//
//  JFLeftHeaderView.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/22.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFLeftHeaderView.h"

@implementation JFLeftHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFLeftHeaderView";
    JFLeftHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFLeftHeaderView" owner:nil options:nil] lastObject];
        
        headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login"]];
    }
    
    return headView;
}

@end
