
//
//  IWRootNavigationContriller.m
//  iwork99
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "IWRootNavigationContriller.h"


@implementation IWRootNavigationContriller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO; //取消透明
    //导航的背景颜色
    [self.navigationBar setBarTintColor:MAINCOLOR];

    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault]; //去掉黑线
    self.navigationBar.shadowImage = [[UIImage alloc] init]; //去掉黑线
    //导航上标题颜色/字体大小
    UIFont *navigationTitleFont;
    if (IS_IPHONE_5){
        navigationTitleFont = [UIFont systemFontOfSize:16];
    }else if (IS_IPHONE_6){
        navigationTitleFont = [UIFont systemFontOfSize:17];
    }else if (IS_IPHONE_6P){
        navigationTitleFont = [UIFont systemFontOfSize:18];
    }else{
        navigationTitleFont = [UIFont systemFontOfSize:17];
    }
    NSDictionary* textAttributes = @{NSFontAttributeName : navigationTitleFont,NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationBar.titleTextAttributes = textAttributes;
    
    //导航上左右按钮的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
}


@end
