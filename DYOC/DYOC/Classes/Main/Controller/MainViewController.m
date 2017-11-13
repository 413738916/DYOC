//
//  MainViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITabBar.appearance.tintColor = [UIColor orangeColor];
    
    [self addChildVC:@"Home"];
    [self addChildVC:@"Live"];
    [self addChildVC:@"Follow"];
    [self addChildVC:@"Me"];
    
}

- (void)addChildVC:(NSString *)storyName {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyName bundle:nil];
    UIViewController *childVC = [storyboard instantiateInitialViewController];
    [self addChildViewController:childVC];
    
    
    UIButton *bddsd = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 50, 50)];
    bddsd.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bddsd];
    [bddsd addTarget:self action:@selector(sdsdsdsdsd) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)sdsdsdsdsd {
//    [self.childViewControllers.firstObject removeFromParentViewController];
//    UIViewController *dsds = self.childViewControllers.firstObject;
//    dsds = nil;
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
