//
//  CollectionNormalCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionNormalCell.h"
#import "AnchorModel.h"

@interface CollectionNormalCell ()

@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;

@end

@implementation CollectionNormalCell

- (void)setAnchor:(AnchorModel *)anchor {
    
    [super setAnchor:anchor];
    
    self.roomNameLabel.text = anchor.room_name;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
