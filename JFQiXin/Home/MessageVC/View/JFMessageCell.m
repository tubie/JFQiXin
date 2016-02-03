//
//  JFMessageCell.m
//  baoxiu51
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFMessageCell.h"
#import "JFMessageFrame.h"
#import "JFMessage.h"
#import "UIImage+Extension.h"

@interface JFMessageCell()
/**
 *  时间
 */
@property (nonatomic, weak) UILabel *timeView;
/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;
/**
 *  正文
 */
@property (nonatomic, weak) UIButton *textView;
@end


@implementation JFMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"message";
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    JFMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JFMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 子控件的创建和初始化
        // 1.时间
        UILabel *timeView = [[UILabel alloc] init];
        timeView.textAlignment = NSTextAlignmentCenter;
        timeView.textColor = [UIColor grayColor];
        timeView.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:timeView];
        self.timeView = timeView;
        
        // 2.头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 3.正文
        UIButton *textView = [[UIButton alloc] init];
        textView.titleLabel.numberOfLines = 0; // 自动换行
        textView.titleLabel.font = JFTextFont;
        textView.contentEdgeInsets = UIEdgeInsetsMake(JFTextPadding, JFTextPadding, JFTextPadding, JFTextPadding);
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        // 4.设置cell的背景色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMessageFrame:(JFMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    
    JFMessage *message = messageFrame.message;
    
    // 1.时间
    self.timeView.text = message.time;
    self.timeView.frame = messageFrame.timeF;
    
    // 2.头像
    NSString *icon = (message.type == JFMessageTypeMe) ? @"icon_repairManChat" : @"icon_serviceGirlChat";
    self.iconView.image = [UIImage imageNamed:icon];
    self.iconView.frame = messageFrame.iconF;
    
    // 3.正文
    [self.textView setTitle:message.text forState:UIControlStateNormal];
    self.textView.frame = messageFrame.textF;
    
    // 4.正文的背景
    if (message.type == JFMessageTypeMe) { // 自己发的,蓝色
        [self.textView setBackgroundImage:[UIImage resizableImage:@"chat_send_nor"] forState:UIControlStateNormal];
    } else { // 别人发的,白色
        [self.textView setBackgroundImage:[UIImage resizableImage:@"chat_recive_nor"] forState:UIControlStateNormal];
        //        [self.textView setBackgroundImage:[UIImage resizableImage:@"chat_send_nor"] forState:UIControlStateNormal];
        
    }
}

@end
