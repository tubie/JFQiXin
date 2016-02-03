//
//  JFHomeMenuBoxCell.h
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <UIKit/UIKit.h>

@protocol JFHomeMenuBoxCellDelagate <NSObject>

@optional
-(void)didSelectToCOntroller:(UIButton *)button;

@end

@interface JFHomeMenuBoxCell : UITableViewCell

@property(nonatomic, weak)id <JFHomeMenuBoxCellDelagate>delegate;
- (IBAction)TodayTaskBtnClick:(id)sender;
- (IBAction)todayScheduleBtnClick:(id)sender;
- (IBAction)announcementInformBtnClick:(id)sender;
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
