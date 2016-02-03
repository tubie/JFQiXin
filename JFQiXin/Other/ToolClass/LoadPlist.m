//
//  LoadPlist.m
//  JFQiXin
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "LoadPlist.h"

@implementation LoadPlist

+(NSDictionary *)loadPlistFromPlistName:(NSString *)name{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
  

}

@end
