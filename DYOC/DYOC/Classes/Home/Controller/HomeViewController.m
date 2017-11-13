//
//  HomeViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "HomeViewController.h"

#import "UIBarButtonItem+CT.h"
#import "PageTitleView.h"
#import "PageContentView.h"

#import "RecommendViewController.h"
#import "GameViewController.h"
#import "AmuseViewController.h"
#import "FunnyViewController.h"

#define kTitleViewH 40

@interface HomeViewController () <PageTitleViewDelegate,PageContentViewDelegate>

@property (nonatomic, strong) PageTitleView *pageTitleView;
@property (nonatomic, strong) PageContentView *pageContentView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
}

- (PageTitleView *)pageTitleView {
    if (!_pageTitleView) {
        CGRect titleFrame = CGRectMake( 0,  kStatusBarH + kNavigationBarH, kScreenW,  kTitleViewH);
        NSArray *titles = @[@"推荐", @"游戏", @"娱乐", @"趣玩"];
        _pageTitleView.frame = titleFrame;
        _pageTitleView = [[PageTitleView alloc]initWithFrame:titleFrame titles:titles];
        _pageTitleView.delegate = self;
    }
    return _pageTitleView;
}

- (PageContentView *)pageContentView {
    if (!_pageContentView) {
        // 1.确定内容的frame
        CGFloat contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH;
        CGRect contentFrame = CGRectMake(0, kStatusBarH + kNavigationBarH + kTitleViewH, kScreenW, contentH);
        
        // 2.确定所有的子控制器
        NSArray *childVcs = [NSArray arrayWithObjects:[[RecommendViewController alloc] init],[[GameViewController alloc] init],[[AmuseViewController alloc] init],[[FunnyViewController alloc] init], nil];
        _pageContentView = [[PageContentView alloc]initWithFrame:contentFrame childVcs:childVcs parentViewController:self];
        _pageContentView.deldgate = self;
    }
    return _pageContentView;
}

- (void)setupUI {
    // 0.不需要调整UIScrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 1.设置导航栏
    [self setupNavigationBar];

    // 2.添加TitleView
    [self.view addSubview:self.pageTitleView];
   
    // 3.添加ContentView
    [self.view addSubview:self.pageContentView];

}

- (void)setupNavigationBar {
    
    // 1.设置左侧的Item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"logo" highImageName:nil size:CGSizeZero];

    // 2.设置右侧的Item
    CGSize size = CGSizeMake(40, 40);
    
    UIBarButtonItem *historyItem = [UIBarButtonItem itemWithImageName:@"image_my_history" highImageName:@"Image_my_history_click" size:size];
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"btn_search" highImageName:@"btn_search_clicked" size:size];
    UIBarButtonItem *qrcodeItem = [UIBarButtonItem itemWithImageName:@"Image_scan" highImageName:@"Image_scan_click" size:size];
    
    self.navigationItem.rightBarButtonItems = @[historyItem, searchItem, qrcodeItem];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    MyLog(@"nihao");
    
    if (_pageTitleView) {
        MyLog(@"%@",_pageTitleView);
        MyLog(@"_pageTitleView");
    }
}

#pragma mark - PageTitleViewDelegate

- (void)pageTitleView:(PageTitleView *)pageTitleView selectedIndex:(int)index {
    [_pageContentView setCurrentIndex:index];
}

#pragma mark - PageContentViewDelegate

- (void)pageContentView:(PageContentView *)pageContentView progress:(float)progress sourceIndex:(int)sourceIndex targetIndex:(int)targetIndex {
    
    [_pageTitleView setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}




@end
