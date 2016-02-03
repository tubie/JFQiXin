//
//  JFScheduleCenterViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFScheduleCenterViewController.h"
#import "JFCalendarPickerView.h"
@interface JFScheduleCenterViewController ()

@end

@implementation JFScheduleCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self initView];
    [self initData];
    
    [self initCalendarPickView];
    
    // Do any additional setup after loading the view.dy_back@2x
}

-(void)initNav{
    self.title = @"日程中心";
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(leftBarItemClick) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rigthBarItem = [UIBarButtonItem initWithNormalImage:@"green_add" target:self action:@selector(rigthBarItemClick) width:22 height:22];
    self.navigationItem.rightBarButtonItem = rigthBarItem;

}
-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rigthBarItemClick{
    
}
-(void)initCalendarPickView{
    JFCalendarPickerView *calendarPicker = [JFCalendarPickerView showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 0, JFSCREENWIDTH, 360);
    calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
    };

    
}
-(void)initView{

}
-(void)initData{

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
