//
//  RecommendCycleView.m
//  DYOC
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RecommendCycleView.h"

#import "CollectionCycleCell.h"

#define kCycleCellID @"kCycleCellID"

@interface RecommendCycleView () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RecommendCycleView

+ (RecommendCycleView *)recommendCycleView {
    
    return [[NSBundle mainBundle] loadNibNamed:@"RecommendCycleView" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionCycleCell" bundle:nil] forCellWithReuseIdentifier:kCycleCellID];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = self.collectionView.bounds.size;
    
    self.pageControl.userInteractionEnabled = NO;

}

- (void)setCycleModels:(NSMutableArray *)cycleModels {
    
    _cycleModels = cycleModels;
    
    [self.collectionView reloadData];
    
    self.pageControl.numberOfPages = cycleModels.count;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cycleModels.count*60 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    [self removeCycleTimer];
    [self addCycleTimer];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cycleModels.count * 10000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCycleCellID forIndexPath:indexPath];
    
    cell.cycleModel = self.cycleModels[indexPath.row % self.cycleModels.count];
    
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5;
    
    self.pageControl.currentPage = (int)(offsetX / scrollView.bounds.size.width) % (int)_cycleModels.count;

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeCycleTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addCycleTimer];
}


- (void)addCycleTimer {
    
    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)removeCycleTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollToNext {
    CGFloat currentOffsetX = self.collectionView.contentOffset.x;
    CGFloat offsetX = currentOffsetX + self.collectionView.bounds.size.width;
    
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];

}

@end
