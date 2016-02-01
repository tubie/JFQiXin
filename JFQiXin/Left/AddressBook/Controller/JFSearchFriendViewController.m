//
//  JFSearchFriendViewController.m
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFSearchFriendViewController.h"
#import "JFAddressBookCell.h"
#import "JFUserModel.h"
@interface JFSearchFriendViewController ()

@property (nonatomic, strong) NSMutableArray *data;


@end

@implementation JFSearchFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JFAddressBookCell class] forCellReuseIdentifier:@"JFAddressBookCell"];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    _data = [[NSMutableArray alloc] init];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.originY = HEIGHT_NAVBAR + HEIGHT_STATUSBAR;
    self.tableView.frameHeight = JFSCREENHEIGHT - self.tableView.originY;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"联系人";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFAddressBookCell"];
    
    JFUserModel *userModel = [_data objectAtIndex:indexPath.row];
    cell.userModel = userModel;
//    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
//    indexPath.row == _data.count - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    [_data removeAllObjects];
    for (JFUserModel *user in _friendsArray) {
        if ([user.userID containsString:searchText] || [user.username containsString:searchText] || [user.nikename containsString:searchText] || [user.pinyin containsString:searchText] || [user.initial containsString:searchText]) {
            [_data addObject:user];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
