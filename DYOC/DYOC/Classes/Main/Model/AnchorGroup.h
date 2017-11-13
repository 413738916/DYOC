//
//  AnchorGroup.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseGameModel.h"

@interface AnchorGroup : BaseGameModel

@property (nonatomic, copy) NSString *icon_name;
@property (nonatomic, strong) NSMutableArray *room_list;
@property (nonatomic, strong) NSMutableArray *anchors;

@end
