//
//  SelectRootViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/23.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "SelectRootViewController.h"
#import "JFHomeViewController.h"
#import "JFLeftViewController.h"
@implementation SelectRootViewController

+(RESideMenu *)rootViewController {
    JFNavigationController *navigationController = [[JFNavigationController alloc] initWithRootViewController:[[JFHomeViewController alloc] init]];
    
    
    JFLeftViewController *leftVC = [[JFLeftViewController alloc]init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftVC
                                                                   rightMenuViewController:nil];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    
    return sideMenuViewController;
}

@end
