//
//  SelectRootViewController.m
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

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
