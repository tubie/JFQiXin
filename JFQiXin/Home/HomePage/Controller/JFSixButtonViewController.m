//
//  JFSixButtonViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/11/2.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFSixButtonViewController.h"

@interface JFSixButtonViewController ()
- (IBAction)buttonClick:(id)sender;

@end

@implementation JFSixButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)buttonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
