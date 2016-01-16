//
//  JFViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/25.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFViewController.h"

@interface JFViewController ()

@end

@implementation JFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(leftBarItemClick) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    // Do any additional setup after loading the view.
}

-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
