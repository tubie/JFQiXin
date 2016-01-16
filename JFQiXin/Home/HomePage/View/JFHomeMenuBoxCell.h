//
//  JFHomeMenuBoxCell.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/22.
//  Copyright © 2015年 JF. All rights reserved.
//

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
