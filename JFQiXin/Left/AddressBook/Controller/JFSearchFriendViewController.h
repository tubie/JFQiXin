//
//  JFSearchFriendViewController.h
//  JFQiXin
//
//  Created by jianfanglin on 16/1/19.
//  Copyright © 2016年 JF. All rights reserved.
//

#import "JFCommonTableViewController.h"

@interface JFSearchFriendViewController : JFCommonTableViewController<UISearchResultsUpdating>

@property (nonatomic, copy) NSMutableArray *friendsArray;


@end
