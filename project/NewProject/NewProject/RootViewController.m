//
//  RootViewController.m
//  NewProject
//
//  Created by juanMac on 2017/12/25.
//  Copyright © 2017年 juanMac. All rights reserved.
//  所有控制器的父控制器，公共方法写在这里

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)initWithTabTitle:(NSString *)tabTitle tabImage:(NSString *)image tabSelectImage:(NSString *)selectImage
{
    if (self = [super init]) {
        //设置NavigationItem的title
        //设置tabBar
        UIImage *imag1 = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imag2 = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:tabTitle image:imag1  selectedImage:imag2];
        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MAINCOLOR,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected | UIControlStateHighlighted];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
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
