//
//  JFAddressBookViewController.h
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import <UIKit/UIKit.h>

@interface JFAddressBookViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *friendsArray;     // 好友列表数据
@property (nonatomic, strong) NSMutableArray *data;             // 格式化的好友列表数据
@property (nonatomic, strong) NSMutableArray *section;          // 拼音首字母列表

@end
