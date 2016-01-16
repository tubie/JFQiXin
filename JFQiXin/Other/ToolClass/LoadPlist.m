//
//  LoadPlist.m
//  JFQiXin
//
//  Created by jianfanglin on 15/12/30.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "LoadPlist.h"

@implementation LoadPlist

+(NSDictionary *)loadPlistFromPlistName:(NSString *)name{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
  

}

@end
