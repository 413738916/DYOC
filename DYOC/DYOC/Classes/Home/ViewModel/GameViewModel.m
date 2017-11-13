//
//  GameViewModel.m
//  DYOC
//
//  Created by 123 on 2017/11/9.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "GameViewModel.h"

#import "HttpTool.h"
#import "GameModel.h"
#import "MJExtension.h"

@implementation GameViewModel

- (NSMutableArray *)games {
    if (!_games) {
        _games = [NSMutableArray array];
    }
    return _games;
}

- (void)loadAllGameData:(void (^)())sucess {
    
    [HttpTool getWithPath:@"http://capi.douyucdn.cn/api/v1/getColumnDetail" params:@{@"shortName" : @"game"} success:^(id responseObject) {

        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:responseObject];
        NSArray *dataArray = resultDict[@"data"];

        self.games = [GameModel mj_objectArrayWithKeyValuesArray:dataArray];

        sucess();
    } failure:^(NSError *error) {
        sucess();
    }];
}

@end
