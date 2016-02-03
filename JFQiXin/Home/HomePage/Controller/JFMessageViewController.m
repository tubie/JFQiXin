//
//  JFMessageViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFMessageViewController.h"
#import "JFMessageListCell.h"
#import "JFMessageListModel.h"
#import "JFSendMessageViewController.h"
@interface JFMessageViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)UITableView *messageTableView;
@property(nonatomic,strong)NSMutableArray *modelArray;

@end

@implementation JFMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];

    
    [self initNav];
    
    
    [self initView];
    
}

-(void)initData{
    self.modelArray =  [JFMessageListModel objectArrayWithFilename:@"Message.plist"];
  

}

-(void)initView{
    self.messageTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.messageTableView];

}

-(void)initNav{
    
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(leftBarItemClick) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIBarButtonItem *rigthBarItem = [UIBarButtonItem initWithNormalImage:@"right_baritem" target:self action:@selector(rigthBarItemClick) width:18.5 height:18.5];
    self.navigationItem.rightBarButtonItem = rigthBarItem;

}

-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rigthBarItemClick{

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFMessageListCell *cell = [JFMessageListCell cellWithTableView:tableView];
    cell.messageListModel = self.modelArray [indexPath.row];
    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JFSendMessageViewController *sendMessageVC = [[JFSendMessageViewController alloc]init];
    [self.navigationController pushViewController:sendMessageVC animated:YES];
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
