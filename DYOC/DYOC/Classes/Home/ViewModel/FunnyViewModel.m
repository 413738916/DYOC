//
//  FunnyViewModel.m
//  DYOC
//
//  Created by 123 on 2017/11/9.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "FunnyViewModel.h"

@implementation FunnyViewModel


- (void)loadFunnyData:(void (^)())sucess {

    [self loadAnchorData:NO URLString:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/3" parameters:@{@"limit" : @30, @"offset" : @0} finishedCallback:sucess];

}

@end
