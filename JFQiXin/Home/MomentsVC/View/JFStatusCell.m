//
//  JFStatusCell.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFStatusCell.h"
#import "JFStatus.h"
#import "JFStatusFrame.h"
#import "JFUser.h"
#import "JFStatusToolbar.h"
#import "JFStatusTopView.h"

@interface JFStatusCell ()

/** 顶部的view */
@property (nonatomic, weak) JFStatusTopView *topView;

/** 说说的工具条 */
@property (nonatomic, weak) JFStatusToolbar *statusToolbar;

@end
@implementation JFStatusCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFStatusCell";
    JFStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JFStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.添加顶部的view
        [self setupTopView];
        
        // 2.添加说说的工具条
        [self setupStatusToolbar];
    }
    return self;
}

/**
 *  添加顶部的view
 */
- (void)setupTopView
{
    // 0.设置cell选中时的背景
    self.selectedBackgroundView = [[UIView alloc] init];
    self.backgroundColor = [UIColor clearColor];
    
    /** 1.顶部的view */
    JFStatusTopView *topView = [[JFStatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

/**
 *  添加说说的工具条
 */
- (void)setupStatusToolbar
{
    /** 说说的工具条 */
    JFStatusToolbar *statusToolbar = [[JFStatusToolbar alloc] init];
    [self.contentView addSubview:statusToolbar];
    self.statusToolbar = statusToolbar;
}
/**
 *  拦截frame的设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += IWStatusTableBorder;
    frame.origin.x = IWStatusTableBorder;
    frame.size.width -= 2 * IWStatusTableBorder;
    frame.size.height -= IWStatusTableBorder;
    [super setFrame:frame];
}

#pragma mark - 数据的设置
/**
 *  传递模型数据
 */
- (void)setStatusFrame:(JFStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.设置顶部view的数据
    [self setupTopViewData];
    
    // 2.设置说说工具条的数据
    [self setupStatusToolbarData];
}
/**
 *  设置顶部view的数据
 */
- (void)setupTopViewData
{
    // 1.topView
    self.topView.frame = self.statusFrame.topViewF;
    
    // 2.传递模型数据
    self.topView.statusFrame = self.statusFrame;
}

/**
 *  设置说说工具条的数据
 */
- (void)setupStatusToolbarData
{
    self.statusToolbar.frame = self.statusFrame.statusToolbarF;
    self.statusToolbar.status = self.statusFrame.status;
}
@end
