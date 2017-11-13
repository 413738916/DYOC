//
//  RecommendViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "RecommendViewController.h"

#import "RecommendViewModel.h"
#import "CollectionPrettyCell.h"
#import "AnchorGroup.h"
#import "RecommendCycleView.h"
#import "RecommendGameView.h"

#define kCycleViewH  (kScreenW * 3 / 8)
#define kGameViewH 90

@interface RecommendViewController () 

@property (nonatomic, strong) RecommendViewModel *recommendVM;

@property (nonatomic, strong) RecommendCycleView *cycleView;
@property (nonatomic, strong) RecommendGameView *gameView;

@end

@implementation RecommendViewController

- (RecommendViewModel *)recommendVM {
    if (!_recommendVM) {
        _recommendVM = [[RecommendViewModel alloc]init];
    }
    return _recommendVM;
}

- (RecommendCycleView *)cycleView {
    if (!_cycleView) {
        _cycleView = [RecommendCycleView recommendCycleView];
        _cycleView.frame = CGRectMake( 0, -(kCycleViewH + kGameViewH),  kScreenW, kCycleViewH);
    }
    return _cycleView;
}

- (RecommendGameView *)gameView {
    if (!_gameView) {
        _gameView = [RecommendGameView recommendGameView];
        _gameView.frame = CGRectMake( 0, -kGameViewH,  kScreenW, kGameViewH);
    }
    return _gameView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    
    [super setupUI];
    
    [self.collectionView addSubview:self.cycleView];
    [self.collectionView addSubview:self.gameView];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(kCycleViewH + kGameViewH, 0, 0, 0);
}

- (void)loadData {
    
    self.baseVM = self.recommendVM;
    
    [self.recommendVM requestData:^{

        [self.collectionView reloadData];
        
        NSMutableArray *groups = [NSMutableArray arrayWithArray:self.recommendVM.anchorGroups];
        [groups removeObjectAtIndex:0];
        [groups removeObjectAtIndex:0];

        AnchorGroup *moreGroup =[[AnchorGroup alloc]init];
        moreGroup.tag_name = @"更多";
        [groups addObject:moreGroup];
        
        self.gameView.groups = groups;

        [self loadDataFinished];
            
    }];
    
    [self.recommendVM requestCycleData:^{
        
        self.cycleView.cycleModels = self.recommendVM.cycleModels;
        
    }];
    
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        // 1.取出PrettyCell
        CollectionPrettyCell *prettyCell = [collectionView dequeueReusableCellWithReuseIdentifier:kPrettyCellID forIndexPath:indexPath];
        
        // 2.设置数据
        AnchorGroup *group = self.recommendVM.anchorGroups[indexPath.section];
        prettyCell.anchor = group.anchors[indexPath.row];
        
        return prettyCell;
    } else {
        return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ( indexPath.section == 1 ){
        return CGSizeMake(kNormalItemW, kPrettyItemH);
    }
    
    return CGSizeMake(kNormalItemW, kNormalItemH);
}

@end
