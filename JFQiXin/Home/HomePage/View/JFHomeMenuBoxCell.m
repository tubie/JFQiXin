//
//  JFHomeMenuBoxCell.m
//  JFQiXin
//
//  Created by 保修一站通 on 15/10/22.
//  Copyright © 2015年 JF. All rights reserved.
//

#import "JFHomeMenuBoxCell.h"
#import "JFMenuBoxBtton.h"
@implementation JFHomeMenuBoxCell

- (void)awakeFromNib {
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFHomeMenuBoxCell";
    JFHomeMenuBoxCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFHomeMenuBoxCell" owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//-(void)layoutSubviews{
//    
//    NSArray *NumberArray = @[@"1",@"2",@"3"];
//    for (int i = 0; i < 3; i ++) {
//        JFMenuBoxBtton *button = [[JFMenuBoxBtton alloc]initWithFrame:CGRectMake(i *JFSCREENWIDTH/3, 0, JFSCREENWIDTH/3, 100)];
//        //        button.backgroundColor = [UIColor redColor];
//        [button setTitle:NumberArray[i] forState:UIControlStateNormal];
////        [button setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
//        [self addSubview:button];
//    }
//    
//}
- (IBAction)TodayTaskBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didSelectToCOntroller:)]) {
        [self.delegate didSelectToCOntroller:sender];
    }
    
}

- (IBAction)todayScheduleBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didSelectToCOntroller:)]) {
        [self.delegate didSelectToCOntroller:sender];
    }

}

- (IBAction)announcementInformBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didSelectToCOntroller:)]) {
        [self.delegate didSelectToCOntroller:sender];
    }

}
@end
