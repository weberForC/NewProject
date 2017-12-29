//
//  CommonWebViewController.h
//  NewProject
//
//  Created by juanMac on 2017/12/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol CommonWebViewControllerDelegate <NSObject>
-(void)returnMessageHome;
@end

@interface CommonWebViewController : UIViewController<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic , copy) id<CommonWebViewControllerDelegate> delelgate;

@property (nonatomic , strong) WKWebViewConfiguration *wkConfig;
@property (nonatomic , strong) WKWebView *wkView;
@property (nonatomic , strong) UIProgressView *progressView;
@property (nonatomic , strong) UIView *backView;
@property (nonatomic , strong) NSString *needNavigation;  //是否需要原生导航
@property (nonatomic , copy) NSString *url;
@property (nonatomic , copy) NSString *reloadURL;
@property (nonatomic , copy) NSString *callbackStr;
@property (nonatomic , copy) NSString *webTitle;
@property (nonatomic , copy) NSMutableDictionary *jsParam;
@property (nonatomic , assign) BOOL hiddenNavigation;


-(id)initWithParams:(NSDictionary *)dicParam;
-(void)evalJS:(NSDictionary *)dicParam;
-(void)loadWebViewRequest:(NSMutableURLRequest*)request;

//支付回调
//-(void)sendWXPayCallBack:(NSInteger)returnCode retMsg:(NSString*)returnMsg;
//-(void)sendAliPayCallBack:(NSInteger)returnCode retMsg:(NSDictionary*)returnMsg;
//-(void)sendUnionPayCallBack:(NSString*)returnCode data:(NSDictionary*)returnData;



@end
