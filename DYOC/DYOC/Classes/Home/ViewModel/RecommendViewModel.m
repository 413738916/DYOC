//
//  RecommendViewModel.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RecommendViewModel.h"

#import "NSDate+CT.h"
#import "HttpTool.h"
#import "MJExtension.h"
#import "AnchorModel.h"
#import "AnchorGroup.h"
#import "CycleModel.h"

@interface RecommendViewModel ()

@property (nonatomic, strong) AnchorGroup *bigDataGroup;
@property (nonatomic, strong) AnchorGroup *prettyGroup;

@end

@implementation RecommendViewModel

- (AnchorGroup *)bigDataGroup {
    if (!_bigDataGroup) {
        _bigDataGroup = [[AnchorGroup alloc]init];
    }
    return _bigDataGroup;
}

- (AnchorGroup *)prettyGroup {
    if (!_prettyGroup) {
        _prettyGroup = [[AnchorGroup alloc]init];
    }
    return _prettyGroup;
}

- (NSMutableArray *)cycleModels {
    if (!_cycleModels) {
        _cycleModels = [NSMutableArray array];
    }
    return _cycleModels;
}

- (void)requestData:(void (^)())sucess {
    
    NSString *time = [NSDate getCurrentTime];
    NSDictionary *parameters = @{@"limit" : @"4", @"offset" : @"0", @"time" : time};
    
    
    dispatch_group_t group = dispatch_group_create();
    
    // 请求第一部分推荐数据
    dispatch_group_enter(group);
    [HttpTool getWithPath:@"http://capi.douyucdn.cn/api/v1/getbigDataRoom" params:parameters success:^(id responseObject) {

//        MyLog(@"%@",responseObject);
        
        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:responseObject];
        
        NSArray *dataArray = resultDict[@"data"];
        
        self.bigDataGroup.tag_name = @"热门";
        self.bigDataGroup.icon_name = @"home_header_hot";
        
        self.bigDataGroup.anchors = [AnchorModel mj_objectArrayWithKeyValuesArray:dataArray];
        
//        MyLog(@"dataArray:%@",self.bigDataGroup);
        
        dispatch_group_leave(group);
        
    } failure:^(NSError *error) {

         dispatch_group_leave(group);
    }];

    // 请求第二部分颜值数据
    dispatch_group_enter(group);
    [HttpTool getWithPath:@"http://capi.douyucdn.cn/api/v1/getVerticalRoom" params:parameters success:^(id responseObject) {
        
        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:responseObject];
        NSArray *dataArray = resultDict[@"data"];
        
        self.prettyGroup.tag_name = @"颜值";
        self.prettyGroup.icon_name = @"home_header_phone";
        
        self.prettyGroup.anchors = [AnchorModel mj_objectArrayWithKeyValuesArray:dataArray];
        
        dispatch_group_leave(group);
        
    } failure:^(NSError *error) {
        
        dispatch_group_leave(group);
    }];
    
    // 请求2-12部分游戏数据
    dispatch_group_enter(group);
    [self loadAnchorData:YES URLString:@"http://capi.douyucdn.cn/api/v1/getHotCate" parameters:parameters finishedCallback:^{
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [self.anchorGroups insertObject:self.prettyGroup atIndex:0];
        [self.anchorGroups insertObject:self.bigDataGroup atIndex:0];
        
//        MyLog(@"%@",self.anchorGroups);

        sucess();
    });
    
//    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//        
//        [self.anchorGroups insertObject:self.prettyGroup atIndex:0];
//        [self.anchorGroups insertObject:self.bigDataGroup atIndex:0];
//        
//        MyLog(@"%@",self.anchorGroups);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            sucess();
//        });
//    });
}

- (void)requestCycleData:(void (^)())sucess {
    
    [HttpTool getWithPath:@"http://www.douyutv.com/api/v1/slide/6" params:@{@"version" : @"2.300"} success:^(id responseObject) {
        
        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:responseObject];
        NSArray *dataArray = resultDict[@"data"];

        self.cycleModels = [CycleModel mj_objectArrayWithKeyValuesArray:dataArray];
        
//        MyLog(@"%@",_cycleModels);
        sucess();
    } failure:^(NSError *error) {
        sucess();
    }];
    
}

@end
