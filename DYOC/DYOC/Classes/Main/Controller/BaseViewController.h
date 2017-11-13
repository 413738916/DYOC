//
//  BaseViewController.h
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIView *contentView;

- (void)setupUI;

- (void)loadDataFinished;

@end
