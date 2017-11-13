//
//  CollectionHeaderView.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionHeaderView.h"

#import "AnchorGroup.h"

@implementation CollectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CollectionHeaderView *)collectionHeaderView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"CollectionHeaderView" owner:nil options:nil].firstObject;
    
}

- (void)setGroup:(AnchorGroup *)group {
    
    _group = group;
    
    self.titleLabel.text = group.tag_name;
    
    NSString *imgName = group.icon_name ? group.icon_name : @"home_header_normal";
    self.iconImageView.image = [UIImage imageNamed:imgName];
    
}


@end
