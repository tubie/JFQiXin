//
//  JFCalendarPickerView.h
//  JFCalendarPicker
//
//  Created by 保修一站通 on 15/9/29.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFCalendarPickerView : UIView<UICollectionViewDelegate , UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSInteger day, NSInteger month, NSInteger year);

+ (instancetype)showOnView:(UIView *)view;


@end
