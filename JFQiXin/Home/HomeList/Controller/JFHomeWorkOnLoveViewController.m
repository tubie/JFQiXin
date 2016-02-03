//
//  JFHomeWorkOnLoveViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFHomeWorkOnLoveViewController.h"
#import "JFCreatTitleButton.h"

@interface JFHomeWorkOnLoveViewController ()
@property(nonatomic, strong)NSArray *titArray;

@end

@implementation JFHomeWorkOnLoveViewController


-(void)awakeFromNib{
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initNav];
    [self initView];

    // Do any additional setup after loading the view from its nib.
}

-(void)initData{
    self.titArray = @[@"考勤记录",@"考情排名",@"考情统计",@"外出查看"];

}
-(void)initNav{
    self.title = @"工作考情";
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(leftBarItemClick) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rightBarItem = [UIBarButtonItem initWithTitle:@"设置" titleColor:nil target:self action:@selector(rightBarItemClick) ];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    
}


-(void)rightBarItemClick{

}
-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initView{
    [JFCreatTitleButton titleButtonWith:self.titArray Target:self methods:@selector(titleButtonClick:) showOnView:self.layoutWorkOnLoveBtnView];
    
}

-(void)titleButtonClick:(UIButton *)sender{
    JFLog(@"%ld",(long)sender.tag);

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
