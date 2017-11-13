//
//  CollectionBaseCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionBaseCell.h"

#import "AnchorModel.h"
#import "HttpTool.h"

@implementation CollectionBaseCell

- (void)setAnchor:(AnchorModel *)anchor {
    
    _anchor = anchor;

    // 0.校验模型是否有值
    if (!anchor) {
        return;
    }
    // 1.取出在线人数显示的文字
    NSString *onlineStr;
    if ((int)anchor.online >= 10000) {
        onlineStr = [NSString stringWithFormat:@"%d万在线",anchor.online / 10000];
    } else {
        onlineStr = [NSString stringWithFormat:@"%d在线",anchor.online];
    }
    [self.onlineBtn setTitle:onlineStr forState:0];
    
    // 2.昵称的显示
    self.nickNameLabel.text = anchor.nickname;
    
    // 3.设置封面图片
    [HttpTool downloadImage:anchor.vertical_src place:nil imageView:self.iconImageView];

}

@end
