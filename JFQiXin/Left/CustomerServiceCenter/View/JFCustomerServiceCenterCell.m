//
//  JFCustomerServiceCenterCell.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFCustomerServiceCenterCell.h"

@interface JFCustomerServiceCenterCell ()


@end
@implementation JFCustomerServiceCenterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFCustomerServiceCenterCell";
    JFCustomerServiceCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFCustomerServiceCenterCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
