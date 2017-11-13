//
//  CollectionPrettyCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionPrettyCell.h"

#import "AnchorModel.h"

@interface CollectionPrettyCell ()

@property (weak, nonatomic) IBOutlet UIButton *cityBtn;

@end

@implementation CollectionPrettyCell

- (void)setAnchor:(AnchorModel *)anchor {
    [super setAnchor:anchor];
    
    [self.cityBtn setTitle:anchor.anchor_city forState:0];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
