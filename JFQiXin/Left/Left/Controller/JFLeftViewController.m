//
//  JFLeftViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFLeftViewController.h"
#import "UITableView+JFTableView.h"
#import "JFLeftCell.h"
#import "JFLeftHeaderView.h"
#import "JFHomeViewController.h"
#import <RESideMenu.h>
#import "JFAddressBookViewController.h"
#import "JFApplicationCenterViewController.h"
#import "JFCustomerServiceCenterViewController.h"
#import "JFMyWorkWorldViewController.h"
#import "JFOrganizationSwitchViewController.h"
#import "JFSettingViewController.h"
#import "JFHomeWorkWorldViewController.h"
@interface JFLeftViewController ()
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property(nonatomic, strong)NSArray *titleArray;

@end

@implementation JFLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

-(void)initView{
    self.leftTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Stars"]];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - 懒加载
-(NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"首页",@"我的工作圈",@"通讯录",@"组织切换",@"应用中心",@"客服中心",@"设置"];

    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.titleArray.count;

}


-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JFLeftHeaderView *headerView = [JFLeftHeaderView headViewWithTableView:tableView];
    return headerView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFLeftCell *cell = [JFLeftCell cellWithTableView:tableView];
    cell.leftTitleLabel.text = self.titleArray [indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            
            [self pushToController:[[JFHomeViewController alloc]init]];
            break;
        }
        case 1:{
            
            [self pushToController:[[JFMyWorkWorldViewController alloc]init]];
            break;
        }
        case 2:{
       
            [self pushToController:[[JFAddressBookViewController alloc]init]];
        
            break;
        }
        case 3:{
            
            [self pushToController:[[JFOrganizationSwitchViewController alloc]init]];
            
            break;
        }
        case 4:{
            [self pushToController:[[JFApplicationCenterViewController alloc]init]];

            break;
        }
        case 5:{
            [self pushToController:[[JFCustomerServiceCenterViewController alloc]init]];

            break;
        }
        case 6:{
            [self pushToController:[[JFSettingViewController alloc]init]];

            break;
        }
        default:
            break;
    }

}
-(void)pushToController:(UIViewController *)controller{
    JFNavigationController *Nav = [[JFNavigationController alloc]initWithRootViewController:controller];
    [self.sideMenuViewController setContentViewController:Nav animated:YES];
    [self.sideMenuViewController hideMenuViewController];


}

@end
