//
//  IWRootTabBarController.m
//  iwork99
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "IWRootTabBarController.h"
#import "RootViewController.h"
#import "IWRootNavigationContriller.h"

@interface IWRootTabBarController()<UITabBarControllerDelegate>

@end

@implementation IWRootTabBarController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"我又可爱的出现了，啦啦啦");
    if ([[UserDefaults getValueForKey:@"loginMark"]isEqualToString:@"loginSuccess"]) {
        //已登录
        [self requestNumCart];
    }else{
        //未登录
//        self.viewControllers[3].tabBarItem.badgeValue = 0;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UserDefaults saveValue:@"NO" forKey:@"isFirst"];
    
    //tabbar底部按钮、文字、点击效果
    NSMutableArray * newArr = [[NSMutableArray alloc]initWithCapacity:4];
    //底部按钮对应的类名
    NSMutableArray *_vcArray = [[NSMutableArray alloc] initWithArray:@[@"FirstViewController",@"TwoViewController",@"ThreeViewController",@"FourViewController"]];
    //底部按钮标题
    NSMutableArray * titleArr = [[NSMutableArray alloc] initWithArray:@[@"首页",@"发现",@" 购物车",@"我的"]];
    //底部按钮图片名字
    NSMutableArray * imgNameArr = [[NSMutableArray alloc] initWithArray:@[@"首页",@"发现",@"购物车",@"我的"]];
    //底部按钮高亮图片名字
    NSMutableArray * selectImgNameArr = [[NSMutableArray alloc] initWithArray:@[@"首页-选中",@"发现-选中",@"购物车-选中",@"我的-选中"]];
    
    for (int i = 0; i < _vcArray.count; i ++) {
        RootViewController *rvc;
        rvc = [[NSClassFromString([_vcArray objectAtIndex:i]) alloc] initWithTabTitle:[titleArr objectAtIndex:i] tabImage:[imgNameArr objectAtIndex:i] tabSelectImage:[selectImgNameArr objectAtIndex:i]];
        IWRootNavigationContriller *rnvc = [[IWRootNavigationContriller alloc] initWithRootViewController:rvc];
        [newArr addObject:rnvc];
    }
    self.viewControllers = newArr;
    //tabBar的背景颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    
    self.tabBar.opaque = YES;
//    self.delegate = self;
}

#pragma mark - 获取购物车商品数量
-(void)requestNumCart
{
    [WWYCommonNetWork requestURL:@"" httpMethod:@"GET" params:nil file:nil success:^(id data) {
        
    } fail:^(NSError *error) {
        
    }];
    
}

@end
