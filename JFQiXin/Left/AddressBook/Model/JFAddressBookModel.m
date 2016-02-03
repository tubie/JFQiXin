//
//  JFAddressBookModel.m
//  JFQiXin
//
//  Created by jianfanglin on 16/2/2.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFAddressBookModel.h"
#import "NSString+Extension.h"
@implementation JFAddressBookModel

- (void) setUsername:(NSString *)username
{
    _username = username;
    _pinyin = username.pinyin;
    _initial = username.pinyinInitial;
}

@end
