//
//  JFHomeTodayTaskViewController.m
//  JFQiXin
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

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
