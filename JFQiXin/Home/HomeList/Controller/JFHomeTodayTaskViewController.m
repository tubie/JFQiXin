//
//  JFHomeTodayTaskViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/25.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFHomeTodayTaskViewController.h"
#import "JFWebViewController.h"
@interface JFHomeTodayTaskViewController ()

@end

@implementation JFHomeTodayTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"今日任务";
    
    [self initView];
}

-(void)initView{
    JFWebViewController *webVC = [[JFWebViewController alloc]init];
    webVC.urlStr = @"https://github.com/tubie/JFQiXin";
    [self.view addSubview:webVC.view];

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
