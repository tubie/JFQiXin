//
//  JFAddTaskViewController.m
//  JFQiXin
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFAddTaskViewController.h"
#import "JFAddTaskButton.h"
#import "POP.h"
#define JFWeakSelf __weak typeof(self) weakSelf = self;


static CGFloat const JFSpringFactor = 12;

@interface JFAddTaskViewController ()
/** 标语 */
@property (nonatomic, weak) UIImageView *sloganImageView;
/** 按钮 */
@property (nonatomic, strong) NSMutableArray *buttons;

/** 动画时间 */
@property (nonatomic, strong) NSArray *times;

@end

@implementation JFAddTaskViewController


- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSArray *)times
{
    if (!_times) {
        CGFloat interval = 0.1; // 时间间隔
        //每个按钮根据这个时间数组来显示时间动画的先后
        _times = @[@(5 * interval),
                   @(4 * interval),
                   @(3 * interval),
                   @(2 * interval),
                   @(0 * interval),
                   @(1 * interval),
                   @(6 * interval)]; // 标语的动画时间
    }
    return _times;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 禁止交互
    self.view.userInteractionEnabled = NO;
    
    // 按钮
    [self setupButtons];
    
    // 标语
    [self setupSloganView];
    
}

/*
 * 创建多个按钮
 */
- (void)setupButtons
{
    // 数据
    NSArray *images = @[@"ch2_xinjianrenwu_bg_new", @"ch2_xinjianricheng_bg_new", @"ch2_qiandaodaka_bg_new", @"ch2_fabudongtai_bg_new", @"ch2_fabutongzhi_bg_new", @"ch2_crm_bg_new"];
    NSArray *titles = @[@"新建任务", @"新建日程", @"签到打卡", @"发布动态", @"发布通知", @"JF"];
    
    // 一些参数
    NSUInteger count = images.count;
    int maxColsCount = 3; // 一行的列数
    NSUInteger rowsCount = (count + maxColsCount - 1) / maxColsCount;
    
    // 按钮尺寸
    CGFloat buttonW = JFSCREENWIDTH / maxColsCount;
    CGFloat buttonH = buttonW * 1.2;
    CGFloat buttonStartY = (JFSCREENHEIGHT - rowsCount * buttonH) * 0.5;
    for (int i = 0; i < count; i++) {
        // 创建、添加
        JFAddTaskButton *button = [JFAddTaskButton buttonWithType:UIButtonTypeCustom];
        button.width = -1; // 按钮的尺寸为0，还是能看见文字缩成一个点，设置按钮的尺寸为负数，那么就看不见文字了
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self.view addSubview:button];
        
        // 内容
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        // frame
        CGFloat buttonX = (i % maxColsCount) * buttonW;
        CGFloat buttonY = buttonStartY + (i / maxColsCount) * buttonH;
        
        
        // 初始化一个pop动画对象
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        // 从哪里来
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY - JFSCREENHEIGHT, buttonW, buttonH)];
        
        // 到哪里去
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        // 动画速率
        anim.springSpeed = JFSpringFactor;
        // 摩擦系数
        anim.springBounciness = JFSpringFactor;
        // CACurrentMediaTime()获得的是当前时间
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [button pop_addAnimation:anim forKey:nil];
    }
}

-(void)buttonClick:(UIButton *)sender{
    [self cancel];

}
- (void)setupSloganView
{
    CGFloat sloganY = JFSCREENHEIGHT * 0.2;
    
    // 添加
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganView.y = sloganY - JFSCREENHEIGHT;
    sloganView.centerX = JFSCREENWIDTH * 0.5;
    [self.view addSubview:sloganView];
    self.sloganImageView = sloganView;
    
    JFWeakSelf;
    // 动画
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(sloganY);
    anim.springSpeed = JFSpringFactor;
    anim.springBounciness = JFSpringFactor;
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        // 开始交互
        weakSelf.view.userInteractionEnabled = YES;
    }];
    [sloganView.layer pop_addAnimation:anim forKey:nil];
}

- (IBAction)cancel {
    // 禁止交互
    self.view.userInteractionEnabled = NO;
    
    // 让按钮执行动画
    for (int i = 0; i < self.buttons.count; i++) {
        JFAddTaskButton *button = self.buttons[i];
        
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim.toValue = @(button.layer.position.y + JFSCREENHEIGHT);
        // CACurrentMediaTime()获得的是当前时间
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [button.layer pop_addAnimation:anim forKey:nil];
    }
    
    JFWeakSelf;
    // 让标题执行动画
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(self.sloganImageView.layer.position.y + JFSCREENHEIGHT);
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [weakSelf dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.sloganImageView.layer pop_addAnimation:anim forKey:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self cancel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelBtnClick:(id)sender {
    [self cancel];

}
@end
