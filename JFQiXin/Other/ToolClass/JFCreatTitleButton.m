//
//  JFCreatTitleButton.m
//  JFQiXin
//项目详解：http://www.jianshu.com/p/87b9194c4b01
//源码：   https://github.com/tubie/JFQiXin

#import "JFCreatTitleButton.h"

@implementation JFCreatTitleButton

+(void)titleButtonWith:(NSArray *)array Target:(id)target methods:(SEL)methods showOnView:(UIView *)superView{
    
    //三列
    int totalloc = 2;
    
    CGFloat buttonw = JFSCREENWIDTH/2;
    CGFloat buttonh = 60;
    
    //算出间距
    CGFloat margin=(JFSCREENWIDTH - totalloc * buttonw) / (totalloc + 1);
    //int count=11;
    for (int i = 0; i < array.count; i++) {
        int row = i / totalloc;//行号
        //0/3=0,1/3=0,2/3=1; (i 从0到2都是第一行) i＝ 3的时候第二行
        
        int loc = i % totalloc;//列号
        
        //横坐标
        CGFloat buttonx = margin + (margin + buttonw) * loc;
        
        //纵坐标
        CGFloat buttony = margin + (margin + buttonh) * row;
        
        
        //创建uiview控件
        UIButton *titleButton=[[UIButton alloc]initWithFrame:CGRectMake(buttonx, buttony, buttonw, buttonh)];
        titleButton.tag = i;
        [titleButton setTitle:array[i] forState:UIControlStateNormal];
        [titleButton setBackgroundColor: [UIColor grayColor]];
        [titleButton addTarget:target action:methods forControlEvents:UIControlEventTouchUpInside];
        [superView addSubview:titleButton];
    }
    
    
}

@end
