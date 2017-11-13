//
//  AmuseViewModel.m
//  DYOC
//
//  Created by 123 on 2017/11/9.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "AmuseViewModel.h"

@implementation AmuseViewModel

- (void)loadAmuseData:(void (^)())sucess {
    
    [self loadAnchorData:YES URLString:@"http://capi.douyucdn.cn/api/v1/getHotRoom/2" parameters:nil finishedCallback:sucess];
    
}

@end
