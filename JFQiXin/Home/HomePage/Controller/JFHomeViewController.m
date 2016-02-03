//
//  JFHomeViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFHomeViewController.h"
#import "JFLeftViewController.h"
#import "UIBarButtonItem+JFBarButtonItem.h"
#import <RESideMenu.h>
#import "UITableView+JFTableView.h"
#import "JFHomeCompanyNameCell.h"
#import "JFHomeMenuBoxCell.h"
#import "JFHomeTaskCell.h"
#import "JFMessageViewController.h"
#import "JFHomeTaskCenterViewController.h"
#import "JFScheduleCenterViewController.h"
#import "JFHomeWorkWorldViewController.h"
#import "JFHomeWorkOnLoveViewController.h"
#import "JFHomeTodayTaskViewController.h"
#import "JFHomwtodayScheduleViewController.h"
#import "JFHomeAnnouncementInformViewController.h"
#import "JFSixButtonViewController.h"

#import "JFAddTaskViewController.h"
#import "JFWebViewController.h"
@interface JFHomeViewController ()<UITableViewDataSource, UITableViewDelegate,JFHomeMenuBoxCellDelagate>

@property(nonatomic, strong)UITableView *homeTableView;
@property(nonatomic, strong)NSArray *taskArray;
@property(nonatomic, strong)NSArray *imageArray;

@property(nonatomic, strong)UIView *bgView;

@end

@implementation JFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
    [self initData];
}


-(void)initNav{
    self.title = @"企信";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Balloon"]];
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"left_baritem" target:self action:@selector(presentLeftMenuViewController:) width:24 height:20];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rigthBarItem = [UIBarButtonItem initWithNormalImage:@"home_right_chat_icon" target:self action:@selector(rigthBarItemClick) width:24 height:20];
    self.navigationItem.rightBarButtonItem = rigthBarItem;


}
-(void)rigthBarItemClick{
    JFMessageViewController *messageVC = [[JFMessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];

}
-(void)initView{
    
   self.homeTableView = [UITableView  initWithTableView:CGRectMake(0, 0,JFSCREENWIDTH , JFSCREENHEIGHT -164) withDelegate:self];
    [self.view addSubview:self.homeTableView];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(JFSCREENWIDTH/2-25, JFSCREENHEIGHT-130, 50, 50);
    [addButton setImage:[UIImage imageNamed:@"work_add_btn_start"] forState:UIControlStateNormal];
//    [addButton setImage:[UIImage imageNamed:@"work_add_btn_end"] forState:UIControlStateSelected];
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];

    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, -100, JFSCREENWIDTH, JFSCREENHEIGHT-50)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    bgView.hidden = YES;
    self.bgView = bgView;
    [self.view addSubview:bgView];

}

-(void)addButtonClick:(UIButton *)button{
//    self.bgView.hidden = ! self.bgView.hidden;
    button.selected   = !button.selected;
    
//    JFSixButtonViewController *sixButtonVC = [[JFSixButtonViewController alloc]init];
//    [self presentViewController:sixButtonVC animated:YES completion:nil];
    JFAddTaskViewController *addTaskVC = [[JFAddTaskViewController alloc]initWithNibName:@"JFAddTaskViewController" bundle:nil];
    [self presentViewController:addTaskVC animated:YES completion:nil];
        
}


-(void)initData{
    self.taskArray = @[@"任务中心",@"日程中心",@"工作考勤",@"工作圈"];
    self.imageArray = @[@"work_task_new",@"work_sechude_new",@"work_confirm_new",@"my_working"];
    

}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 30;
    }else if (indexPath.row == 1){
        return 100;
    }else{
        return 60;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.taskArray.count +2;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JFHomeCompanyNameCell *cell = [JFHomeCompanyNameCell cellWithTableView:tableView];
        return cell;
    }else if (indexPath.row == 1){
        JFHomeMenuBoxCell *cell = [JFHomeMenuBoxCell cellWithTableView:tableView];
        cell.delegate = self;
        return cell;
    }else{
        JFHomeTaskCell *cell = [JFHomeTaskCell cellWithTableView:tableView];
        cell.taskTitleLabel.text = self.taskArray [indexPath.row -2];
        cell.taskImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row - 2]];
        return cell;
    
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 2:
        {
            [self pushToController:[[JFHomeTaskCenterViewController alloc]init]];
        }
            break;
        case 3:
        {
            [self pushToController:[[JFScheduleCenterViewController alloc]init]];
        }
            break;
        case 4:
        {
            [self pushToController:[[JFHomeWorkOnLoveViewController alloc]init]];
        }
            break;
        case 5:
        {
            [self pushToController:[[JFHomeWorkWorldViewController alloc]init]];
        }
            break;
            
        default:
            break;
    }
    
}
-(void)pushToController:(UIViewController *)controller{
    [self.navigationController pushViewController:controller animated:YES];

}

#pragma mark - JFHomeMenuBoxCellDelagate
-(void)didSelectToCOntroller:(UIButton *)button{
    switch (button.tag) {
        case 0:
        {
           
//            [self pushToController:[[JFHomeTodayTaskViewController alloc]init]];
            [self pushToController:[[JFWebViewController alloc]init]];

        
        }
            
            break;
        case 1:
        {
//            [self pushToController:[[JFHomwtodayScheduleViewController alloc]init]];
            [self pushToController:[[JFWebViewController alloc]init]];

            
            
        }
            
            break;
        case 2:
        {
//            [self pushToController:[[JFHomeAnnouncementInformViewController alloc]init]];
            [self pushToController:[[JFWebViewController alloc]init]];


        }
            
            break;
            
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
