//
//  AnchorModel.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnchorModel : NSObject

/// 房间ID
@property (nonatomic, assign) int room_id;
/// 房间图片对应的URLString
@property (nonatomic, copy) NSString *vertical_src;
/// 判断是手机直播还是电脑直播
// 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
@property (nonatomic, assign) int isVertical;
/// 房间名称
@property (nonatomic, copy) NSString *room_name;
/// 主播昵称
@property (nonatomic, copy) NSString *nickname;
/// 观看人数
@property (nonatomic, assign) int online;
/// 所在城市
@property (nonatomic, copy) NSString *anchor_city;

@end
