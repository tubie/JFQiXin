//
//  JFMessageCell.h
//  baoxiu51
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <UIKit/UIKit.h>
@class JFMessageFrame;

@interface JFMessageCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) JFMessageFrame *messageFrame;


@end
