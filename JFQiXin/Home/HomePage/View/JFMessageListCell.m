//
//  JFMessageListCell.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFMessageListCell.h"
#import "JFMessageListModel.h"
@implementation JFMessageListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFMessageListCell";
    JFMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFMessageListCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setMessageListModel:(JFMessageListModel *)messageListModel{
    _messageListModel = messageListModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",messageListModel.img]]];
    self.messageLabel.text = messageListModel.message;
    self.timeLabel.text = messageListModel.date;
    self.departmentNameLabel.text = messageListModel.department;
}
@end
