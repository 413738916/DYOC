//
//  RoomShowViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/10.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RoomShowViewController.h"

@interface RoomShowViewController ()

@end

@implementation RoomShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *gobtn = [[UIButton alloc]initWithFrame:CGRectMake(25, 25, 200, 200)];
    [gobtn setTitle:@"你好" forState:0];
    [gobtn setTitleColor:[UIColor redColor] forState:0];
    
    [gobtn addTarget:self action:@selector(gobackto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gobtn];
}

- (void)gobackto {
    [self dismissViewControllerAnimated:NO completion:nil];
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
