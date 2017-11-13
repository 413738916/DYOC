//
//  BaseViewModel.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *anchorGroups;

- (void)loadAnchorData:(BOOL)isGroupData URLString:(NSString *)URLString  parameters:(NSDictionary *)parameters finishedCallback:(void (^)())finishedCallback;

@end
