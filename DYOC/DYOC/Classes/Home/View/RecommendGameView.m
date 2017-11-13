//
//  RecommendGameView.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RecommendGameView.h"

#import "CollectionGameCell.h"

#define kGameCellID @"kGameCellID"
#define kEdgeInsetMargin 10

@interface RecommendGameView () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RecommendGameView

+ (RecommendGameView *)recommendGameView {
    
       return [[NSBundle mainBundle] loadNibNamed:@"RecommendGameView" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionGameCell" bundle:nil] forCellWithReuseIdentifier:kGameCellID];
    
    self.collectionView.contentInset = UIEdgeInsetsMake( 0,  kEdgeInsetMargin, 0, kEdgeInsetMargin);

}


- (void)setGroups:(NSMutableArray *)groups {
    _groups = groups;
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _groups.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGameCellID forIndexPath:indexPath];
    
    cell.baseGame = _groups[indexPath.row];
    return cell;
    
}





@end
