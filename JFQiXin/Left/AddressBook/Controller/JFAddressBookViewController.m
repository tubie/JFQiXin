//
//  JFAddressBookViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFAddressBookViewController.h"
#import "JFAddressBookCell.h"
#import "JFAddressBookHeadView.h"
#import "JFSearchAddressBookCell.h"
#import "JFUserModel.h"
#import "JFDataHelper.h"
#import "JFSearchFriendViewController.h"
@interface JFAddressBookViewController () <UISearchBarDelegate>
@property(nonatomic ,strong)UITableView * addressBookTableView;
@property (nonatomic, strong) UILabel *footerLabel;
@property (nonatomic, strong) UISearchController *searchController;
@property(nonatomic, strong)NSArray *tagImageArray;
@property(nonatomic, strong)NSArray *tagTitleArray;


@property (nonatomic, strong) JFSearchFriendViewController *searchVC;

@end

@implementation JFAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self initView];
    [self initData];
}
-(void)initNav{
    self.title = @"通讯录";
    UIBarButtonItem *leftBarItem = [UIBarButtonItem initWithNormalImage:@"dy_back" target:self action:@selector(presentLeftMenuViewController:) width:44 height:44];
    self.navigationItem.leftBarButtonItem = leftBarItem;

}

-(void)initView{
     [self.addressBookTableView registerClass:[JFAddressBookHeadView class] forHeaderFooterViewReuseIdentifier:@"JFAddressBookHeadView"];
    [self.addressBookTableView setTableHeaderView:self.searchController.searchBar];
    self.view.backgroundColor = [UIColor whiteColor];
    self.addressBookTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT-64) withDelegate:self];
    [self.addressBookTableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];

    [self.view addSubview:self.addressBookTableView];
}

#pragma mark - Private Methods
- (void) initData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        JFUserModel *user1 = [[JFUserModel alloc] init];
        user1.username = @"吕轻侯";
        user1.nikename = @"侯哥";
        user1.userID = @"yun";
        user1.avatarURL = @"1.jpg";
        [_friendsArray addObject:user1];
        JFUserModel *user2 = [[JFUserModel alloc] init];
        user2.username = @"白展堂";
        user2.userID = @"小白2";
        user2.nikename = @"堂堂";
        user2.avatarURL = @"4.jpg";
        [_friendsArray addObject:user2];
        JFUserModel *user3 = [[JFUserModel alloc] init];
        user3.username = @"李秀莲";
        user3.userID = @"xiulian";
        user3.nikename = @"大嘴";
        user3.avatarURL = @"8.jpg";
        [_friendsArray addObject:user3];
        JFUserModel *user4 = [[JFUserModel alloc] init];
        user4.username = @"燕小六";
        user4.userID = @"xiao6";
        user4.avatarURL = @"11.jpg";
        [_friendsArray addObject:user4];
        JFUserModel *user5 = [[JFUserModel alloc] init];
        user5.username = @"郭芙蓉";
        user5.userID = @"furongMM";
        user5.avatarURL = @"12.jpg";
        [_friendsArray addObject:user5];
        JFUserModel *user6 = [[JFUserModel alloc] init];
        user6.username = @"佟湘玉";
        user6.userID = @"yu";
        user6.nikename = @"掌柜嗒";
        user6.avatarURL = @"7.jpg";
        [_friendsArray addObject:user6];
        JFUserModel *user7 = [[JFUserModel alloc] init];
        user7.username = @"莫小贝";
        user7.userID = @"XB";
        user7.nikename = @"小贝";
        user7.avatarURL = @"10.jpeg";
        [_friendsArray addObject:user7];
        
        
        self.tagImageArray  =  @[@"plugins_FriendNotify",@"add_friend_icon_addgroup",@"Contact_icon_ContactTag",@"add_friend_icon_offical"];
        self.tagTitleArray  =  @[@"新的朋友",@"群聊",@"标签",@"公众号"];

        
        _data = [JFDataHelper getFriendListDataBy:_friendsArray];
        _section = [JFDataHelper getFriendListSectionBy:_data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.addressBookTableView reloadData];
            [_footerLabel setText:[NSString stringWithFormat:@"%lu位联系人", (unsigned long)_friendsArray.count]];
        });
    });
}
#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.tagImageArray.count;
    }
    NSArray *array = [_data objectAtIndex:section - 1];
    return array.count;
  
}
#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 22;
    }
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    JFAddressBookHeadView *headerView = [JFAddressBookHeadView headViewWithTableView:tableView ];
    headerView.titleLabel.text = [self.section objectAtIndex:section];
    return  headerView;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFAddressBookCell *cell = [JFAddressBookCell cellWithTableView:tableView];

    if (indexPath.section == 0) {
        cell.iconImageView.image = [UIImage imageNamed:self.tagImageArray[indexPath.row]];
        cell.userNameLabel.text = self.tagTitleArray[indexPath.row];
        return cell;

    }else{
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        JFUserModel *user = [array objectAtIndex:indexPath.row];
        cell.userModel = user;
        return cell;
        
    }
}

// 拼音首字母检索
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _section;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 检索时空出搜索框
- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.addressBookTableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

- (JFSearchFriendViewController *) searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[JFSearchFriendViewController alloc] init];
    }
    return _searchVC;
}

- (UISearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater: self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:RGBA(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

@end
