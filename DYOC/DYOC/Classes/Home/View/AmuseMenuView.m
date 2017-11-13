//
//  AmuseMenuView.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "AmuseMenuView.h"

#import "AmuseMenuViewCell.h"

#define kMenuCellID @"kMenuCellID"
@interface AmuseMenuView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation AmuseMenuView

+ (AmuseMenuView *)amuseMenuView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"AmuseMenuView" owner:nil options:nil].firstObject;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AmuseMenuViewCell" bundle:nil] forCellWithReuseIdentifier:kMenuCellID];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = self.collectionView.bounds.size;
    
    self.pageControl.userInteractionEnabled = NO;
}

- (void)setGroups:(NSMutableArray *)groups {
    _groups = groups;
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.groups == nil) { return 0; }
    NSUInteger pageNum = (self.groups.count - 1) / 8 + 1;
    self.pageControl.numberOfPages = pageNum;

    return pageNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AmuseMenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMenuCellID forIndexPath:indexPath];
    
    [self setupCellDataWithCell:cell indexPath:indexPath];
    
    return cell;
}

- (void)setupCellDataWithCell:(AmuseMenuViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    // 0页: 0 ~ 7
    // 1页: 8 ~ 15
    // 2也: 16 ~ 23
    // 1.取出起始位置&终点位置
    NSUInteger startIndex = indexPath.row * 8;
    NSUInteger endIndex = (indexPath.row + 1) * 8 - 1;
    
    // 2.判断越界问题
    if ( endIndex > self.groups.count - 1 ){
        endIndex = self.groups.count - 1;
    }
    
    // 3.取出数据,并且赋值给cell
    NSMutableArray *dataA = [NSMutableArray array];
    for (NSUInteger i = startIndex; i <= endIndex; i++) {
        [dataA addObject:self.groups[i]];
    }
    cell.groups = dataA;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width);
}

@end
