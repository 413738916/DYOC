//
//  RoomNormalViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/10.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RoomNormalViewController.h"

@interface RoomNormalViewController ()

@end

@implementation RoomNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *gobtn = [[UIButton alloc]initWithFrame:CGRectMake(25, 25, 200, 200)];
    [gobtn setTitle:@"你好" forState:0];
    [gobtn setTitleColor:[UIColor redColor] forState:0];
    
    [gobtn addTarget:self action:@selector(gobackto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gobtn];
    
    
//    self.navigationController.navigationBar.translucent = YES;
//    
//    UIColor *color = [UIColor orangeColor];
//    CGRect csdd= CGRectMake(0, 0, kScreenW, 64);
//    UIGraphicsBeginImageContext(csdd.size);
//    CGContextRef contect = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(contect, [color CGColor]);
//    CGContextFillRect(contect, csdd);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
//    
//    self.navigationController.navigationBar.clipsToBounds = YES;
    

}

- (void)gobackto {
    [self.navigationController pushViewController:[[RoomNormalViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];

//      [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
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
