//
//  CollectionGameCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "CollectionGameCell.h"

#import "HttpTool.h"

@interface CollectionGameCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CollectionGameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setBaseGame:(BaseGameModel *)baseGame {
    
    _baseGame = baseGame;
    
    self.titleLabel.text = baseGame.tag_name;
    
    if (baseGame.icon_url) {
        [HttpTool downloadImage:baseGame.icon_url place:nil imageView:self.iconImageView];
    }
    else {
        _iconImageView.image = [UIImage imageNamed:@"home_more_btn"];
    }
}

@end
