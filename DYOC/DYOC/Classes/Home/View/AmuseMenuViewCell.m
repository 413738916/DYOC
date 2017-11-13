//
//  AmuseMenuViewCell.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "AmuseMenuViewCell.h"

#import "CollectionGameCell.h"

#define kGameCellID @"kGameCellID"

@interface AmuseMenuViewCell () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation AmuseMenuViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionGameCell" bundle:nil] forCellWithReuseIdentifier:kGameCellID];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.collectionView.bounds.size.width <= kScreenW) {
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
        
        float aItemW = floorf(self.collectionView.bounds.size.width / 4.0);
        float aItemH = floorf(self.collectionView.bounds.size.height / 2.0);
        
        layout.itemSize = CGSizeMake(aItemW, aItemH);
        
    }
}


- (void)setGroups:(NSMutableArray *)groups {
    _groups = groups;
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groups.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGameCellID forIndexPath:indexPath];
    
    cell.baseGame = self.groups[indexPath.item];
    cell.clipsToBounds = YES;
    
    return cell;
}



@end
