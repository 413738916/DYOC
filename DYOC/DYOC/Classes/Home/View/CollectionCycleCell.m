//
//  CollectionCycleCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionCycleCell.h"

#import "CycleModel.h"
#import "HttpTool.h"

@interface CollectionCycleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CollectionCycleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCycleModel:(CycleModel *)cycleModel {
    
    _cycleModel = cycleModel;
    
    self.titleLabel.text = cycleModel.title;
    
    [HttpTool downloadImage:cycleModel.pic_url place:[UIImage imageNamed:@"Img_default"] imageView:self.iconImageView];
}

@end
