//
//  CustomNavigationController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CustomNavigationController.h"

#import <objc/runtime.h>

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIGestureRecognizer *systemGes = self.interactivePopGestureRecognizer;
    UIView *gesView = systemGes.view;
    
     unsigned int count;
   objc_property_t *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
    
    for (int i = 0; i<count; i++) {
        objc_property_t ivar = ivars[i];
        const char *cName = ivar_getName(ivar);
        MyLog(@"%@",[NSString stringWithFormat:@"%s",cName]);
        
    }
    
    NSArray *targets = [systemGes valueForKey:@"_targets"];
    NSObject *targetObjc = [targets objectAtIndex:0];
    [targetObjc valueForKey:@"target"];
    
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    
    
    UIPanGestureRecognizer *pang = [[UIPanGestureRecognizer alloc]init];
    [gesView addGestureRecognizer:pang];
    [pang addTarget:[targetObjc valueForKey:@"target"] action:action];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
    
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
