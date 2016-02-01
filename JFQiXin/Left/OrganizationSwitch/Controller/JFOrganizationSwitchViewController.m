//
//  JFOrganizationSwitchViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/23.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFOrganizationSwitchViewController.h"
#import "JFCustomerServiceCenterCell.h"
@interface JFOrganizationSwitchViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *organizationTableView;
@property(nonatomic,strong)NSArray *organizationSwitchArray;

@end

@implementation JFOrganizationSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initNav];
    
    [self initView];
}


-(void)initNav{
    self.title  =@"组织切换";

    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}


-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.organizationTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.organizationTableView];
}

-(void)initData{
    self.organizationSwitchArray = @[@"上海XXX软件科技有限公司",@"腾讯",@"百度",@"阿里"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.organizationSwitchArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFCustomerServiceCenterCell *cell = [JFCustomerServiceCenterCell cellWithTableView:tableView];
    cell.listLabel.text = self.organizationSwitchArray[indexPath .row] ;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
