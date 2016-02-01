//
//  JFUserModel.m
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFUserModel.h"
#import "NSString+Extension.h"
@implementation JFUserModel
- (void) setUsername:(NSString *)username
{
    _username = username;
    _pinyin = username.pinyin;
    _initial = username.pinyinInitial;
}
@end
