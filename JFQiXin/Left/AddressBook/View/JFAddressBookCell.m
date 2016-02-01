//
//  JFAddressBookCell.m
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFAddressBookCell.h"
#import "JFUserModel.h"

@interface JFAddressBookCell ()



@end
@implementation JFAddressBookCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFAddressBookCell";
    JFAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




-(void)setUserModel:(JFUserModel *)userModel{
    _userModel = userModel;
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",userModel.avatarURL]];
    self.userNameLabel.text = userModel.username;
}





@end
