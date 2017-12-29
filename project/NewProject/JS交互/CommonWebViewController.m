//
//  CommonWebViewController.m
//  NewProject
//
//  Created by juanMac on 2017/12/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "CommonWebViewController.h"
#import "AppDelegate.h"

@interface CommonWebViewController ()
{
    NSDictionary *paramDic;  //传过来的数据
    NSString *currentUrl;   //当前加载的url
}

@end

CGFloat yPoint;
@implementation CommonWebViewController
@synthesize wkView;
@synthesize url;
@synthesize callbackStr;
@synthesize jsParam;
@synthesize hiddenNavigation;
@synthesize reloadURL;
@synthesize backView;

-(id)initWithParams:(NSDictionary *)dicParam
{
    if(self=[super init]){
        paramDic = [NSDictionary dictionaryWithDictionary:dicParam];
        if([dicParam objectForKey:@"callback"]){
            callbackStr=[dicParam objectForKey:@"callback"];
        }
        if([dicParam objectForKey:@"url"]){
            url=[dicParam objectForKey:@"url"];
        }
        if([dicParam objectForKey:@"jsParam"]){
            jsParam=(NSMutableDictionary*)[dicParam objectForKey:@"jsParam"];
        }
        _wkConfig=[[WKWebViewConfiguration alloc] init];
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.tabBarController.tabBar.hidden = YES;
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    statusBarView.backgroundColor=MAINCOLOR;
    [self.view addSubview:statusBarView];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(hiddenNavigation)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self.needNavigation isEqualToString:@"YES"]) {
        hiddenNavigation=NO;
        yPoint=0;
    }else{
        //默认隐藏导航
        hiddenNavigation=YES;
        yPoint=0;
    }
    [self initWebView];
}

- (void)initWebView
{
    if(hiddenNavigation){
        //webview Y坐标，后续可改为动态计算。
        yPoint=20;
        //无导航栏时，scrollview子类自动设置inset导致定位异常滚动条异常。
        //关闭自动调整选项，手动设置布局。
        self.automaticallyAdjustsScrollViewInsets = NO;
    }else{
        [self creatnavgation];
        yPoint=64;
    }
    
    
    
    
    
}

//创建导航栏
-(void)creatnavgation
{
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navView.backgroundColor = MAINCOLOR;
    [self.view addSubview:navView];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 28, 15, 25);
    [button setBackgroundImage:[UIImage imageNamed:@"返回-icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(barBackClick) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:button];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(40, 27, SCREEN_WIDTH-80, 30)];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = Font(22);
    title.tag = 1008;
    if ([paramDic objectForKey:@"navBarTitle"]) {
        title.text = paramDic[@"navBarTitle"];
    }else{
        title.text = @"";
    }
    
    [navView addSubview:title];
}

#pragma mark -- 导航按钮
- (void)barBackClick
{
    if ([currentUrl rangeOfString:@"https://m.ecloudsign.com/#/main/contract?"].location !=NSNotFound) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if([wkView canGoBack]){
            [wkView goBack];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
        //        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        //        NSString *cookie = [jsNative getLoginSuccessCookies];
        //        [request addValue:cookie forHTTPHeaderField:@"Cookie"];
        //        [wkView loadRequest:request];
    }
    
}


-(void)evalJS:(NSDictionary *)dicParam
{
    
}
-(void)loadWebViewRequest:(NSMutableURLRequest*)request
{
    
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
