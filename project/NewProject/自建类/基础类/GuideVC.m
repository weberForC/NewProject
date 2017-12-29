//
//  GuideVC.m
//  NewWork1
//
//  Created by juan on 16/2/24.
//  Copyright © 2016年 juan. All rights reserved.
//

#import "GuideVC.h"
#import "IWRootTabBarController.h"

@interface GuideVC ()<UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    UIPageControl * pageControl;
    CGFloat pix;
}

@end

@implementation GuideVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    pix = SCREEN_WIDTH/750.0;
    
    //背景图
    scrollView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    [self theLayoutGuide];
    
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    [self.view addSubview:scrollView];
    
    //页码指示器
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-75 *pix, SCREEN_HEIGHT - 100 *pix, 150 *pix, 20 *pix)];
    pageControl.numberOfPages = 3;
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self.view addSubview:pageControl];
    
}
//布局引导界面以及滑动功能
- (void)theLayoutGuide
{
    NSArray * yinDaoArr = @[@"guide1.png",@"guide2.png",@"guide3.png"];
    for (int i = 0; i < 3; i++) {
        
        UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.image = [UIImage imageNamed:[yinDaoArr objectAtIndex:i]];
        [scrollView addSubview:bgView];
        
        if (i == 2) {
            bgView.userInteractionEnabled = YES;
            UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            startBtn.frame = CGRectMake(SCREEN_WIDTH/2-130*pix, SCREEN_HEIGHT - 250*pix, 260 *pix, 80 *pix);
            [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
            [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            UIColor *blueColor=MAINCOLOR;
            [startBtn setBackgroundColor:blueColor];
            startBtn.layer.cornerRadius = 10 *pix;
            [bgView addSubview:startBtn];
        }
    }
}
//跳转到登录
- (void) startBtnClick
{
    self.view.window.rootViewController = [[IWRootTabBarController alloc]init];
}
#pragma mark - scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scroll
{
    float a = [[NSString stringWithFormat:@"%.2f",scroll.contentOffset.x/SCREEN_WIDTH] floatValue];
    if (a>2.2) {
        self.view.window.rootViewController = [[IWRootTabBarController alloc]init];
    }else{
        NSInteger num = scroll.contentOffset.x/SCREEN_WIDTH;
        pageControl.currentPage = num;
    }
}

@end
