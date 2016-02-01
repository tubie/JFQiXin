//
//  JFAddressBookViewController.h
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFAddressBookViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *friendsArray;     // 好友列表数据
@property (nonatomic, strong) NSMutableArray *data;             // 格式化的好友列表数据
@property (nonatomic, strong) NSMutableArray *section;          // 拼音首字母列表




@end
