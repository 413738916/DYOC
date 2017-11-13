//
//  NSDate+CT.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "NSDate+CT.h"

@implementation NSDate (CT)

+ (NSString *)getCurrentTime {
    
    NSDate *nowDate = [NSDate date];
    
    int interval = [nowDate timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%d",interval];
    
}

@end
