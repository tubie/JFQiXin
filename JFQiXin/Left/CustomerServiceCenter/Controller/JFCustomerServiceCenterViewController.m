//
//  JFCustomerServiceCenterViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFCustomerServiceCenterViewController.h"
#import "JFCustomerServiceCenterCell.h"
@interface JFCustomerServiceCenterViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *customerServiceCenterTableView;
@property(nonatomic, strong)NSArray *titleListArray;

@end

@implementation JFCustomerServiceCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initNav];
    [self initView];
    

}

-(void)initNav{
    self.title  =@"客服平台";
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}

-(void)initView{
    self.customerServiceCenterTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.customerServiceCenterTableView];

}

-(void)initData{
    self.titleListArray = @[@"功能介绍",@"意见反馈"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleListArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFCustomerServiceCenterCell *cell = [JFCustomerServiceCenterCell cellWithTableView:tableView];
    cell.listLabel.text = self.titleListArray[indexPath.row];
    return cell;

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
