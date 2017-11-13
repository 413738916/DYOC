//
//  CollectionHeaderView.h
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnchorGroup;

@interface CollectionHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (nonatomic, strong) AnchorGroup *group;

+ (CollectionHeaderView *)collectionHeaderView;

@end
