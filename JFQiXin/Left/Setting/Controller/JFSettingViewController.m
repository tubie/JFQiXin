//
//  JFSettingViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFSettingViewController.h"
#import "JFCustomerServiceCenterCell.h"
#import "JFSettingExitFootView.h"
@interface JFSettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView *settingTableView;
@property(nonatomic, strong)NSArray *settingArray;

@end

@implementation JFSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    [self initNav];
    

}

-(void)initData{
    self.settingArray =  @[@"个人信息",@"清除缓存",@"修改密码",@"分享企信",@"关于企信"];

}
-(void)initNav{
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;


}
-(void)initView{
    self.settingTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.settingTableView];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.settingArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 4) {
        return 60;
    }else{
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFCustomerServiceCenterCell *cell = [JFCustomerServiceCenterCell cellWithTableView:tableView];
    cell.listLabel.text = self.settingArray [indexPath.section];
    return cell;

}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 4) {
        JFSettingExitFootView *footView = [JFSettingExitFootView footViewWithTableView:tableView];
        return footView;
    }else{
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
