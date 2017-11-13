//
//  RecommendViewModel.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//


#import "BaseViewModel.h"

@interface RecommendViewModel : BaseViewModel

@property (nonatomic, strong) NSMutableArray *cycleModels;

- (void)requestData:(void (^) ())sucess;

- (void)requestCycleData:(void (^) ())sucess;

@end
