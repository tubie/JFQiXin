//
//  JFAddressBookViewController.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/26.
//  Copyright © 2015年 JF. All rights reserved.
//
#import "JFAddressBookViewController.h"
#import "JFAddressBookCell.h"
#import "NSString+Extension.h"
#import "JFAddressBookModel.h"
#import "JFAddressBookHeaderView.h"
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
        user1.username = @"吕轻侯";
        user1.nikename = @"侯哥";
        user1.userID = @"yun";
        user1.avatarURL = @"1.jpg";
        [_friendsArray addObject:user1];
        JFAddressBookModel *user2 = [[JFAddressBookModel alloc] init];
        user2.username = @"白展堂";
        user2.userID = @"小白2";
        user2.nikename = @"堂堂";
        user2.avatarURL = @"4.jpg";
        [_friendsArray addObject:user2];
        JFAddressBookModel *user3 = [[JFAddressBookModel alloc] init];
        user3.username = @"李秀莲";
        user3.userID = @"xiulian";
        user3.nikename = @"大嘴";
        user3.avatarURL = @"8.jpg";
        [_friendsArray addObject:user3];
        JFAddressBookModel *user4 = [[JFAddressBookModel alloc] init];
        user4.username = @"燕小六";
        user4.userID = @"xiao6";
        user4.avatarURL = @"11.jpg";
        [_friendsArray addObject:user4];
        JFAddressBookModel *user5 = [[JFAddressBookModel alloc] init];
        user5.username = @"郭芙蓉";
        user5.userID = @"furongMM";
        user5.avatarURL = @"12.jpg";
        [_friendsArray addObject:user5];
        JFAddressBookModel *user6 = [[JFAddressBookModel alloc] init];
        user6.username = @"佟湘玉";
        user6.userID = @"yu";
        user6.nikename = @"掌柜嗒";
        user6.avatarURL = @"7.jpg";
        [_friendsArray addObject:user6];
        JFAddressBookModel *user7 = [[JFAddressBookModel alloc] init];
        user7.username = @"莫小贝";
        user7.userID = @"XB";
        user7.nikename = @"小贝";
        user7.avatarURL = @"10.jpeg";
        [_friendsArray addObject:user7];
        
        _data = [self getFriendListDataBy:_friendsArray];
        _section = [self getFriendListSectionBy:_data];
        
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
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        JFAddressBookModel *user = [array objectAtIndex:indexPath.row];
        cell.addressBookModel = user;
    }
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    JFAddressBookHeaderView *headerView = [JFAddressBookHeaderView headViewWithTableView:tableView];
    headerView.keyTitleLabel.text = [self.section objectAtIndex:section];
    return headerView;
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
        return 0;
    }
    return 22.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *) getFriendListDataBy:(NSMutableArray *)array
{
    NSMutableArray *ans = [[NSMutableArray alloc] init];
    
    NSArray *serializeArray = [(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {        // 排序
        int i;
        NSString *strA = ((JFAddressBookModel *)obj1).pinyin;
        NSString *strB = ((JFAddressBookModel *)obj2).pinyin;
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;          // 上升
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;         // 下降
            }
        }
        
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    char lastC = '1';
    NSMutableArray *data;
    NSMutableArray *oth = [[NSMutableArray alloc] init];
    for (JFAddressBookModel *user in serializeArray) {
        char c = [user.pinyin characterAtIndex:0];
        if (!isalpha(c)) {
            [oth addObject:user];
        }
        else if (c != lastC){
            lastC = c;
            if (data && data.count > 0) {
                [ans addObject:data];
            }
            
            data = [[NSMutableArray alloc] init];
            [data addObject:user];
        }
        else {
            [data addObject:user];
        }
    }
    if (data && data.count > 0) {
        [ans addObject:data];
    }
    if (oth.count > 0) {
        [ans addObject:oth];
    }
    
    return ans;
}

-(NSMutableArray *)getFriendListSectionBy:(NSMutableArray *)array
{
    NSMutableArray *section = [[NSMutableArray alloc] init];
    [section addObject:UITableViewIndexSearch];
    for (NSArray *item in array) {
        JFAddressBookModel *user = [item objectAtIndex:0];
        char c = [user.pinyin characterAtIndex:0];
        if (!isalpha(c)) {
            c = '#';
        }
        [section addObject:[NSString stringWithFormat:@"%c", toupper(c)]];
    }
    
    return section;
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
