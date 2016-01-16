//
//  JFCollectionViewCell.m
//  JFCalendarPicker
//
//  Created by 保修一站通 on 15/9/29.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import "JFCollectionViewCell.h"

@implementation JFCollectionViewCell

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}

@end
