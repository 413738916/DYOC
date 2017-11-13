//
//  PageContentView.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "PageContentView.h"

#define ContentCellID @"ContentCellID"

@interface PageContentView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *childVcs;
@property (nonatomic, strong) UIViewController *parentViewController;
@property (nonatomic, assign) CGFloat startOffsetX;

@property (nonatomic, assign) BOOL isForbidScrollDelegate;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PageContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.childVcs = childVcs;
        self.parentViewController = parentViewController;
        
        [self setupUI];
    }
    return self;
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 1.创建layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
        // 2.创建UICollectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollsToTop = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ContentCellID];
        
    }
    return _collectionView;
}

- (void)setupUI {
    
    for (int i = 0 ; i < _childVcs.count; i++) {
        
        UIViewController *childVc = (UIViewController *)_childVcs[i];
        [self.parentViewController addChildViewController:childVc];
    }
    
    // 2.添加UICollectionView,用于在Cell中存放控制器的View
    [self addSubview:self.collectionView];
    self.collectionView.frame = self.bounds;
    
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    MyLog(@"%d",_childVcs.count);
    return _childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ContentCellID forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    MyLog(@"%ld",(long)indexPath.item);
    
    UIViewController *childVc = (UIViewController *)_childVcs[indexPath.item];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MyLog(@"%d",indexPath.row);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    _isForbidScrollDelegate = NO;
    
    _startOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 0.判断是否是点击事件
    if (_isForbidScrollDelegate) {
        return;
    }
    
    // 1.定义获取需要的数据
    float progress = 0;
    int sourceIndex = 0;
    int targetIndex = 0;
    
    // 2.判断是左滑还是右滑
    float currentOffsetX = scrollView.contentOffset.x;
    float scrollViewW = scrollView.bounds.size.width;
    if (currentOffsetX > _startOffsetX) { // 左滑
        // 1.计算progress
        progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW);
        
        // 2.计算sourceIndex
        sourceIndex = (int)(currentOffsetX / scrollViewW);
        
        // 3.计算targetIndex
        targetIndex = sourceIndex + 1;
        if (targetIndex >= _childVcs.count) {
            progress = 1;
            targetIndex = (int)_childVcs.count - 1;
        }
        
        // 4.如果完全划过去
        if (currentOffsetX - _startOffsetX == scrollViewW) {
            progress = 1;
            targetIndex = sourceIndex;
        }
    } else { // 右滑
        // 1.计算progress
        progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW));
        
        // 2.计算targetIndex
        targetIndex = (int)(currentOffsetX / scrollViewW);
        
        // 3.计算sourceIndex
        sourceIndex = targetIndex + 1;
        if (sourceIndex >= _childVcs.count) {
            sourceIndex = (int)_childVcs.count - 1;
        }
    }
    
//    MyLog(@"%f %d %d",progress,sourceIndex,targetIndex);
    
    // 3.将progress/sourceIndex/targetIndex传递给titleView
    if ([_deldgate respondsToSelector:@selector(pageContentView:progress:sourceIndex:targetIndex:)]) {
        [_deldgate pageContentView:self progress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
    }
}

- (void)setCurrentIndex:(int)currentIndex {
    
    // 1.记录需要进制执行代理方法
    _isForbidScrollDelegate = YES;
    
    // 2.滚动正确的位置
    float offsetX = currentIndex * _collectionView.frame.size.width;    
    [_collectionView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    
}


@end
