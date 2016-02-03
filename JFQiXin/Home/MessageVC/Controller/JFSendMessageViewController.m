//
//  JFSendMessageViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFSendMessageViewController.h"
#import "JFMessageFrame.h"
#import "JFMessage.h"
#import "JFMessageCell.h"
@interface JFSendMessageViewController ()<UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic, strong)UITableView *sendMessageTableView;
@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (nonatomic, strong) NSDictionary *autoreply;

@property (nonatomic, strong)UITextField *inputView;

@end

@implementation JFSendMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initView];
    [self initData];
    [self initChatToolView];
}

- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *mfArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            // 消息模型
            JFMessage *msg = [JFMessage messageWithDict:dict];
            
            // 取出上一个模型
            JFMessageFrame *lastMf = [mfArray lastObject];
            JFMessage *lastMsg = lastMf.message;
            
            // 判断两个消息的时间是否一致
            msg.hideTime = [msg.time isEqualToString:lastMsg.time];
            
            // frame模型
            JFMessageFrame *mf = [[JFMessageFrame alloc] init];
            mf.message = msg;
            
            // 添加模型
            [mfArray addObject:mf];
        }
        
        _messageFrames = mfArray;
    }
    return _messageFrames;
}
-(void)initNav{
    self.title = @"聊天中。。。";
    self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scenery_icon_chat"]];
}


-(void)initView{
    self.sendMessageTableView = [UITableView initWithTableView:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT-64-49) withDelegate:self];
    self.sendMessageTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.sendMessageTableView];

}

//初始化底部聊天工具栏
-(void)initChatToolView{
    //    UIView *bgView = (UIView *)[self.view viewWithTag:99];
    
    UIView *chatToolView = [[UIView alloc]initWithFrame:CGRectMake(0, JFSCREENHEIGHT- 64-49, JFSCREENWIDTH, 49)];
    chatToolView.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
    [self.view addSubview:chatToolView];
    
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH(self.view), 0.5)];
    line1.image = [UIImage imageNamed:@"icon_line"];
    [chatToolView addSubview:line1];
    
    UIButton *voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    voiceBtn.frame = CGRectMake(11, (kHEIGHT(chatToolView) - 29) / 2, 29, 29);
    [voiceBtn setImage:[UIImage imageNamed:@"icon_voiceBtn"] forState:UIControlStateNormal];
    [chatToolView addSubview:voiceBtn];
    
    self.inputView = [[UITextField alloc]initWithFrame:CGRectMake(kXW(voiceBtn)+10, 5, JFSCREENWIDTH-120, 30)];
    self.inputView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.inputView.leftViewMode = UITextFieldViewModeAlways;
    self.inputView.returnKeyType = UIReturnKeySend;
    self.inputView.delegate = self;
    [chatToolView addSubview:self.inputView];
    
    UIImageView *imageViewLine = [[UIImageView alloc]initWithFrame:CGRectMake(kX(self.inputView), kYH(self.inputView) + 3, kWIDTH(self.inputView) + 10, 0.5)];
    imageViewLine.image = [UIImage imageNamed:@"icon_line"];
    [chatToolView addSubview:imageViewLine];
    
    UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    iconBtn.frame = CGRectMake(kXW(self.inputView)-10, 10, 22, 23);
    [iconBtn setImage:[UIImage imageNamed:@"icon_ smileBtn"] forState:UIControlStateNormal];
    [chatToolView addSubview:iconBtn];
    
    UIButton *addUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addUpBtn.frame = CGRectMake(kWIDTH(self.view) - 40, kY(voiceBtn), 29, 29);
    [addUpBtn setImage:[UIImage imageNamed:@"icon_addBtn"] forState:UIControlStateNormal];
    [chatToolView addSubview:addUpBtn];
    
    
    // 2.监听键盘的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)initData{
}

/**
 *  当键盘改变了frame(位置和尺寸)的时候调用
 */
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 设置窗口的颜色
//    UITableView *tableView = (UITableView *)[self.view viewWithTag:1];
//    UIView *bgView = (UIView *)[self.view viewWithTag:99];
//    
//    self.view.window.backgroundColor = tableView.backgroundColor;
    
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height -64;
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
}

/**
 *  发送一条消息
 */
- (void)addMessage:(NSString *)text type:(MJMessageType)type
{
    
    // 1.数据模型
    JFMessage *msg = [[JFMessage alloc] init];
    msg.type = type;
    msg.text = text;
    // 设置数据模型的时间
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    // NSDate  --->  NSString
    // NSString ---> NSDate
    //    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //  2014-08-09 15:45:56
    // 09/08/2014  15:45:56
    msg.time = [fmt stringFromDate:now];
    
    // 看是否需要隐藏时间
    JFMessageFrame *lastMf = [self.messageFrames lastObject];
    JFMessage *lastMsg = lastMf.message;
    msg.hideTime = [msg.time isEqualToString:lastMsg.time];
    
    // 2.frame模型
    JFMessageFrame *mf = [[JFMessageFrame alloc] init];
    mf.message = msg;
    [self.messageFrames addObject:mf];
    
    // 3.刷新表格
    [self.sendMessageTableView reloadData];
    
    // 4.自动滚动表格到最后一行
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.sendMessageTableView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}




/**
 *  根据自己发的内容取得自动回复的内容
 *
 *  @param text 自己发的内容
 */
- (NSString *)replayWithText:(NSString *)text
{
    for (int i = 0; i<text.length; i++) {
        NSString *word = [text substringWithRange:NSMakeRange(i, 1)];
        
        if (self.autoreply[word]){
            return self.autoreply[word];
        }
    }
    
    return @"XXX帅哥美女多帅哥美女多帅哥美女多";
}

#pragma mark - 文本框代理
/**
 *  点击了return按钮(键盘最右下角的按钮)就会调用
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 1.模拟自己发一条消息
    [self addMessage:textField.text type:JFMessageTypeMe];
    
    // 2.模拟自动回复一条消息
    NSString *reply = [self replayWithText:textField.text];
    [self addMessage:reply type:JFMessageTypeOther];
    
    // 3.清空文字
    self.inputView.text = nil;
    
    // 返回YES即可
    return YES;
}

/**
 *  当开始拖拽表格的时候就会调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    [self.view endEditing:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JFMessageFrame *mf = self.messageFrames[indexPath.row];
    return mf.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1.创建cell
    JFMessageCell *cell = [JFMessageCell cellWithTableView:tableView];
    // 2.给cell传递模型
    cell.messageFrame = self.messageFrames[indexPath.row];
    // 3.返回cell
    return cell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
