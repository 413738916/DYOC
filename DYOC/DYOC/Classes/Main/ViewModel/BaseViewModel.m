//
//  BaseViewModel.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseViewModel.h"

#import "HttpTool.h"
#import "MJExtension.h"
#import "AnchorGroup.h"
#import "AnchorModel.h"

@implementation BaseViewModel

- (NSMutableArray *)anchorGroups {
    if (!_anchorGroups) {
        _anchorGroups = [NSMutableArray array];
    }
    return _anchorGroups;
}

- (void)loadAnchorData:(BOOL)isGroupData URLString:(NSString *)URLString parameters:(NSDictionary *)parameters finishedCallback:(void (^)())finishedCallback {
    
    [HttpTool getWithPath:URLString params:parameters success:^(id responseObject) {
        
        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:responseObject];
        NSArray *dataArray = resultDict[@"data"];
        
        if (isGroupData) {
            self.anchorGroups = [AnchorGroup mj_objectArrayWithKeyValuesArray:dataArray];
        }
        else {
            
            AnchorGroup *group = [[AnchorGroup alloc]init];
            group.anchors = [AnchorModel mj_objectArrayWithKeyValuesArray:dataArray];
            [self.anchorGroups addObject:group];
        }
        finishedCallback();
        
    } failure:^(NSError *error) {
        finishedCallback();
    }];
    
}

@end
