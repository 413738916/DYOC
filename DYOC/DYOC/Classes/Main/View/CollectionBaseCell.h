//
//  CollectionBaseCell.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnchorModel;

@interface CollectionBaseCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *onlineBtn;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

@property (nonatomic, strong) AnchorModel *anchor;

@end
