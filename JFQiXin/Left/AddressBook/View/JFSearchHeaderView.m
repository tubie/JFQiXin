//
//  JFSearchHeaderView.m
//  JFQiXin
//
//  Created by jianfanglin on 16/2/3.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFSearchHeaderView.h"

@implementation JFSearchHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFSearchHeaderView";
    JFSearchHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFSearchHeaderView" owner:nil options:nil] lastObject];
        
    }
    
    return headView;
}

@end
