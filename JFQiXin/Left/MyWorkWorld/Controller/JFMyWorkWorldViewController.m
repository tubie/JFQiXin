//
//  JFMyWorkWorldViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/23.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFMyWorkWorldViewController.h"

@interface JFMyWorkWorldViewController ()

@end

@implementation JFMyWorkWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNav{
    self.title = @"我的朋友圈";
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    
}

-(void)initData{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
