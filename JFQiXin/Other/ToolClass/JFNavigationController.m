//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin


#import "JFNavigationController.h"

@interface JFNavigationController ()

@end

@implementation JFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航控制器的view的背景图片
    self.view.backgroundColor = [UIColor whiteColor];
    //是否透明
    self.navigationBar.translucent = NO;
    
    //设置导航栏的颜色，字体大小，字体颜色
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, kFONT16, NSFontAttributeName, nil]];
    
    self.navigationBar.barTintColor = [UIColor whiteColor];

    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;//视图控制器，四条边不指定
        self.extendedLayoutIncludesOpaqueBars = NO;//不透明的操作栏
        self.modalPresentationCapturesStatusBarAppearance = NO;
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@""]
                                          forBarPosition:UIBarPositionTop
                                              barMetrics:UIBarMetricsDefault];
    }
    else
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""]
                                 forBarMetrics:UIBarMetricsDefault];
    }
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
