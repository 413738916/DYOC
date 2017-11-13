//
//  AnchorGroup.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "AnchorGroup.h"

#import "MJExtension.h"
#import "AnchorModel.h"

@implementation AnchorGroup

- (NSMutableArray *)anchors {
    if (!_anchors) {
        _anchors = [NSMutableArray array];
    }
    return _anchors;
}

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"room_list" : [AnchorModel class],
             @"anchors" : [AnchorModel class]
             };
    
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"anchors" : @"room_list"
          };
}


@end
