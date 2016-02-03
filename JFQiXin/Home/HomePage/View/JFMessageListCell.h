//
//  JFMessageListCell.h
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <UIKit/UIKit.h>
@class JFMessageListModel;
@interface JFMessageListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentNameLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)JFMessageListModel *messageListModel;


@end
