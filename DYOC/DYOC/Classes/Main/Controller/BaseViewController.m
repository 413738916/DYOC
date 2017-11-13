//
//  BaseViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIImageView *animImageView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (UIImageView *)animImageView {
    if (!_animImageView) {
        _animImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_loading_1"]];
        _animImageView.center = self.view.center;
        _animImageView.animationImages = @[[UIImage imageNamed:@"img_loading_1"], [UIImage imageNamed:@"img_loading_2"]];
        _animImageView.animationDuration = 0.5;
        _animImageView.animationRepeatCount = MAXFLOAT;
        _animImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    }
    return _animImageView;
}

- (void)setupUI {
    // 1.隐藏内容的View
    self.contentView.hidden = YES;
    
    // 2.添加执行动画的UIImageView
    [self.view addSubview:self.animImageView];
    
    // 3.给animImageView执行动画
    [self.animImageView startAnimating];
    
    // 4.设置view的背景颜色
    self.view.backgroundColor = kColor(350, 250, 250);

}

- (void)loadDataFinished {
    // 1.停止动画
    [self.animImageView stopAnimating];
    
    // 2.隐藏animImageView
    self.animImageView.hidden = YES;
    
    // 3.显示内容的View
    self.contentView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
