//
//  JFWebViewController.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/15.
//  Copyright (c) 2015年 JF团购. All rights reserved.
////  项目详解：
//  github:https://github.com/tubie/JFTudou
//  简书：http://www.jianshu.com/p/2156ec56c55b


#import "JFWebViewController.h"

@interface JFWebViewController ()<UIWebViewDelegate>
{
    UILabel *_titleLabel;
    int _isFirstIn;
    
    //
    UIActivityIndicatorView *_activityView;
}


@end

@implementation JFWebViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _isFirstIn = 0;
    
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initViews{
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, JFSCREENWIDTH, JFSCREENHEIGHT-64)];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    self.urlStr = @"https://github.com/tubie/JFQiXin";
    
    NSString *urlStr = [NSString stringWithFormat:@"%@",self.urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.webView loadRequest:request];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(JFSCREENWIDTH/2-15, JFSCREENHEIGHT/2-15, 30, 30)];
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activityView.hidesWhenStopped = YES;
    [self.view addSubview:_activityView];
    [self.view bringSubviewToFront:_activityView];
}

-(void)OnBackBtn:(UIButton *)sender{
    NSLog(@"_isFirstIn:%d",_isFirstIn);
    if (_isFirstIn <= 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        _isFirstIn = _isFirstIn - 2;
        [self.webView goBack];
    }
    
}


#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = theTitle;
    [_activityView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [_activityView startAnimating];
    _isFirstIn++;
    return YES;
}


@end
