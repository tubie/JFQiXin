//
//  JFApplicationCenterViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFApplicationCenterViewController.h"
#import "JFApplicationCenterCell.h"
@interface JFApplicationCenterViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *ApplicationCenterTableView;

@end

@implementation JFApplicationCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self initView];
    [self initData];
}


-(void)initNav{
    self.title  =@"应用";
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}

-(void)initView{
    self.ApplicationCenterTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.ApplicationCenterTableView];
}

-(void)initData{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFApplicationCenterCell *cell = [JFApplicationCenterCell cellWithTableView:tableView];
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
