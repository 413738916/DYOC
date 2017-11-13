//
//  CycleModel.m
//  DYOC
//
//  Created by 123 on 2017/11/8.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CycleModel.h"

#import "AnchorModel.h"

@implementation CycleModel

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"room" : [AnchorModel class],
             @"anchor" : [AnchorModel class]
             };
    
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"anchor" : @"room"
             };
}

@end
