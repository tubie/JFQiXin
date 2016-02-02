//
//  JFAddressBookCell.m
//  JFQiXin
//
//  Created by jianfanglin on 16/2/2.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFAddressBookCell.h"
#import "JFAddressBookModel.h"
@implementation JFAddressBookCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFAddressBookCell";
    JFAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFAddressBookCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setAddressBookModel:(JFAddressBookModel *)addressBookModel{
    _addressBookModel = addressBookModel;
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",addressBookModel.avatarURL]];
    self.userNameLabel.text  = addressBookModel.username;
}
@end
