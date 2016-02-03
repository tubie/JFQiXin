//
//  JFSettingExitFootView.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFSettingExitFootView.h"

@implementation JFSettingExitFootView


- (IBAction)exitClick:(id)sender {
}

+ (instancetype)footViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"JFSettingExitFootView";
    JFSettingExitFootView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JFSettingExitFootView" owner:nil options:nil] lastObject];
    }
    
    return headView;
}

@end
