//
//  UITableView+JFTableView.h
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <UIKit/UIKit.h>

@interface UITableView (JFTableView)
/**
 *  快速创建tableView
 *
 *  @param frame    tableView的frame
 *  @param delegate 代理
 *
 *  @return 返回一个自定义的tableView
 */
+ (UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate;
@end
