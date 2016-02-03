//
//  JFHomeWorkWorldViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFHomeWorkWorldViewController.h"
#import "LoadPlist.h"
#import "JFStatus.h"
#import "JFStatusFrame.h"
#import "JFStatusCell.h"
@interface JFHomeWorkWorldViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *statusFrames;
@property (nonatomic, strong)UITableView *tableView;


@end

@implementation JFHomeWorkWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];

    
    [self initNav];
    
    [self initView];
    

}

#pragma mark - 初始化数据
-(void)initData{
    NSDictionary *dict =  [LoadPlist loadPlistFromPlistName:@"FriendDynamic.plist"];
    NSArray * modelArray =  dict[@"statuses"];
    NSMutableArray *statusArray =  [JFStatus objectArrayWithKeyValuesArray:modelArray];
    NSMutableArray *statusFrameArray = [NSMutableArray array];
    for (JFStatus *status in statusArray) {
        JFStatusFrame *statusFrame = [[JFStatusFrame alloc] init];
        // 传递说说模型数据
        statusFrame.status = status;
        [statusFrameArray addObject:statusFrame];
    }
    
    // 赋值
    self.statusFrames = statusFrameArray;
}

-(void)initNav{
    self.title = @"工作圈";
    
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(leftBarItemClick) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;

    self.view.backgroundColor = [UIColor whiteColor];
    
}
-(void)leftBarItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initView{
    self.tableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    JFStatusCell *cell = [JFStatusCell cellWithTableView:tableView];
    
    // 2.传递frame模型
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
