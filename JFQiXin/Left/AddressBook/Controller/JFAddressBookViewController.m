//
//  JFAddressBookViewController.m
//  JFQiXin//
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFAddressBookViewController.h"
#import "JFAddressBookCell.h"
#import "NSString+Extension.h"
#import "JFAddressBookModel.h"
#import "JFAddressBookHeaderView.h"
#import "JFSortingByLetter.h"
#import "JFSearchHeaderView.h"
@interface JFAddressBookViewController ()
@property(nonatomic, strong)UITableView *addressBookTableView;
@property(nonatomic, strong)NSArray *imageArray;
@property(nonatomic, strong)NSArray *titleArray;


@end

@implementation JFAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
    [self initData];
}


-(void)initView{
    [self.view addSubview:self.addressBookTableView];

}

-(void)initNav{
    self.title = @"通讯录";
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;

}

-(UITableView *)addressBookTableView{
    if (_addressBookTableView == nil) {
        _addressBookTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT - 64) withDelegate:self];
    }
    return _addressBookTableView;
}

-(NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"新的朋友",@"群聊",@"标签",@"公众号"];
    }
    return _titleArray;

}

-(NSArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = @[@"plugins_FriendNotify",@"add_friend_icon_addgroup",@"Contact_icon_ContactTag",@"add_friend_icon_offical"];
    }
    return _imageArray;

}
#pragma mark - Private Methods
- (void)initData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        JFAddressBookModel *user1 = [[JFAddressBookModel alloc] init];
        user1.username = @"马云";
        user1.nikename = @"侯哥";
        user1.userID = @"yun";
        user1.avatarURL = @"1.jpg";
        [_friendsArray addObject:user1];
        JFAddressBookModel *user2 = [[JFAddressBookModel alloc] init];
        user2.username = @"李彦宏";
        user2.userID = @"小白2";
        user2.nikename = @"堂堂";
        user2.avatarURL = @"4.jpg";
        [_friendsArray addObject:user2];
        JFAddressBookModel *user3 = [[JFAddressBookModel alloc] init];
        user3.username = @"马化腾";
        user3.userID = @"xiulian";
        user3.nikename = @"大嘴";
        user3.avatarURL = @"8.jpg";
        [_friendsArray addObject:user3];
        JFAddressBookModel *user4 = [[JFAddressBookModel alloc] init];
        user4.username = @"刘强东";
        user4.userID = @"xiao6";
        user4.avatarURL = @"11.jpg";
        [_friendsArray addObject:user4];
        JFAddressBookModel *user5 = [[JFAddressBookModel alloc] init];
        user5.username = @"雷军";
        user5.userID = @"furongMM";
        user5.avatarURL = @"12.jpg";
        [_friendsArray addObject:user5];
        JFAddressBookModel *user6 = [[JFAddressBookModel alloc] init];
        user6.username = @"老罗";
        user6.userID = @"yu";
        user6.nikename = @"掌柜嗒";
        user6.avatarURL = @"7.jpg";
        [_friendsArray addObject:user6];
        JFAddressBookModel *user7 = [[JFAddressBookModel alloc] init];
        user7.username = @"土鳖不土";
        user7.userID = @"XB";
        user7.nikename = @"小贝";
        user7.avatarURL = @"10.jpeg";
        [_friendsArray addObject:user7];
        JFAddressBookModel *user8 = [[JFAddressBookModel alloc] init];
        user8.username = @"乔布斯";
        user8.userID = @"XB";
        user8.nikename = @"小贝";
        user8.avatarURL = @"10.jpeg";
        [_friendsArray addObject:user8];
        JFAddressBookModel *user9 = [[JFAddressBookModel alloc] init];
        user9.username = @"啊扎";
        user9.userID = @"XB";
        user9.nikename = @"小贝";
        user9.avatarURL = @"10.jpeg";
        [_friendsArray addObject:user9];
        
        _data = [JFSortingByLetter getFriendListDataBy:_friendsArray];
        _section = [JFSortingByLetter getFriendListSectionBy:_data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.addressBookTableView reloadData];
        });
    });
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFAddressBookCell *cell = [JFAddressBookCell cellWithTableView:tableView];
    if (indexPath.section == 0) {
        NSString *imageStr = self.imageArray[indexPath.row] ;
        NSString *title = self.titleArray[indexPath.row] ;
        cell.iconImageView.image = [UIImage imageNamed:imageStr];
        cell.userNameLabel.text = title;
        
    }else{
        NSArray *array = [_data objectAtIndex:indexPath.section -1 ];
        JFAddressBookModel *user = [array objectAtIndex:indexPath.row];
        cell.addressBookModel = user;
    }
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        JFSearchHeaderView *searchHeaderView = [JFSearchHeaderView headViewWithTableView:tableView];
        return searchHeaderView;
    }else{
        JFAddressBookHeaderView *headerView = [JFAddressBookHeaderView headViewWithTableView:tableView];
        headerView.backgroundColor = [UIColor redColor];
        headerView.keyTitleLabel.text = [self.section objectAtIndex:section];
        return headerView;
    }
   
}
// 拼音首字母检索
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _section;
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    NSArray *array = [_data objectAtIndex:section - 1];
    return array.count;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52.5f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 44;
    }
    return 30.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
