//
//  CycleModel.h
//  DYOC
//
//  Created by 123 on 2017/11/8.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AnchorModel;

@interface CycleModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, strong) AnchorModel *room;
@property (nonatomic, strong) AnchorModel *anchor;

@end
