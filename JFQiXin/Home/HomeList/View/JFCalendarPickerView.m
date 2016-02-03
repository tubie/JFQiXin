//
//  JFCalendarPickerView.m
//  JFCalendarPicker
//
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFCalendarPickerView.h"
#import "JFCollectionViewCell.h"
#import "UIColor+JFColor.h"
NSString *const JFCalendarCellIdentifier = @"cell";


@interface JFCalendarPickerView ()
@property (weak, nonatomic) IBOutlet UICollectionView *JFCollectionView;

- (IBAction)priviousButton:(id)sender;
- (IBAction)nextButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (nonatomic , strong) NSArray *weekDayArray;
@property (nonatomic , strong) UIView *mask;

@end

@implementation JFCalendarPickerView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self addSwipe];
    [self show];
    
    
}

- (void)awakeFromNib
{
    [_JFCollectionView registerClass:[JFCollectionViewCell class] forCellWithReuseIdentifier:JFCalendarCellIdentifier];
    _JFCollectionView.delegate = self;
    _JFCollectionView.dataSource  =self;
    _weekDayArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
}

- (void)customInterface
{
    CGFloat itemWidth = _JFCollectionView.frame.size.width / 7;
    CGFloat itemHeight = _JFCollectionView.frame.size.height / 7;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [_JFCollectionView setCollectionViewLayout:layout animated:YES];
    
    
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"JF📅%.2ld-%li",(long)[self month:date],(long)[self year:date]]];
    [_JFCollectionView reloadData];
    
  

}

#pragma mark - date
//这个月的天数
- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}

//第几月
- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

//年份
- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}

//这个月的第一天是周几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}



//这个月有几天
- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

//上个月的的时间
- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

//下一个月的时间
- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
#pragma -mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _weekDayArray.count;
    } else {
        return 42;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JFCalendarCellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell.dateLabel setText:_weekDayArray[indexPath.row]];
        cell.dateLabel.textColor = [UIColor brownColor];
    } else {
        NSInteger daysInThisMonth = [self totaldaysInMonth:_date];
        NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        
        if (i < firstWeekday) {
            [cell.dateLabel setText:@""];

            
        }else if (i > firstWeekday + daysInThisMonth - 1){
            [cell.dateLabel setText:@""];
        }else{
            day = i - firstWeekday + 1;
            [cell.dateLabel setText:[NSString stringWithFormat:@"%li",(long)day]];
            [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#6f6f6f"]];

            //this month
            if ([_today isEqualToDate:_date]) {

                if (day == [self day:_date]) {
                    cell.dateLabel.textColor = [UIColor redColor];
                } else if (day > [self day:_date]) {
                    [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];

                }
            } else if ([_today compare:_date] == NSOrderedAscending) {
                [cell.dateLabel setTextColor:[UIColor colorWithHexString:@"#cbcbcb"]];

            }
        }
    }
    return cell;
}

- (void)show
{
    self.transform = CGAffineTransformTranslate(self.transform, 0, - self.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL isFinished) {
        [self customInterface];
    }];
}
+ (instancetype)showOnView:(UIView *)view
{
     JFCalendarPickerView *calendarPicker = [[[NSBundle mainBundle] loadNibNamed:@"JFCalendarPickerView" owner:self options:nil] lastObject];
    
    calendarPicker.mask = [[UIView alloc] initWithFrame:view.bounds];
    calendarPicker.mask.backgroundColor = [UIColor blackColor];
    calendarPicker.mask.alpha = 0.3;
    [view addSubview:calendarPicker.mask];
    [view addSubview:calendarPicker];
    return calendarPicker;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:_date];
    
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekday + 1;
    if (self.calendarBlock) {
        self.calendarBlock(day, [comp month], [comp year]);
    }
    
}



- (void)addSwipe
{
    UISwipeGestureRecognizer *swipLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextButton:)];
    swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipLeft];
    
    UISwipeGestureRecognizer *swipRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(priviousButton:)];
    swipRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipRight];
}



- (IBAction)priviousButton:(id)sender {
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        self.date = [self lastMonth:self.date];
    } completion:nil];

}

- (IBAction)nextButton:(id)sender {
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        self.date = [self nextMonth:self.date];
    } completion:nil];

}
@end
