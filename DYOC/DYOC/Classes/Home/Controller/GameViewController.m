//
//  GameViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "GameViewController.h"

#import "GameViewModel.h"
#import "CollectionHeaderView.h"
#import "RecommendGameView.h"
#import "CollectionGameCell.h"

#define kGameEdgeMargin 10
#define kGameItemW (kScreenW - 2 * kGameEdgeMargin) / 3
#define kGameItemH (kGameItemW * 6 / 5)
#define kGameHeaderViewH 50
#define kGameViewH 90
#define kGameCellID @"kGameCellID"
#define kGameHeaderViewID @"kHeaderViewID"

@interface GameViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) GameViewModel *gameVM;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CollectionHeaderView *topHeaderView;
@property (nonatomic, strong) RecommendGameView *gameView;

@end

@implementation GameViewController

- (GameViewModel *)gameVM {
    if (!_gameVM) {
        _gameVM = [[GameViewModel alloc]init];
    }
    return _gameVM;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 1.创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(kGameItemW, kGameItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.headerReferenceSize = CGSizeMake( kScreenW, kGameHeaderViewH);
        layout.sectionInset = UIEdgeInsetsMake( 0, kGameEdgeMargin, 0,kGameEdgeMargin);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionGameCell" bundle:nil] forCellWithReuseIdentifier:kGameCellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGameHeaderViewID];
        
    }
    return _collectionView;
}

- (CollectionHeaderView *)topHeaderView {
    if (!_topHeaderView) {
        _topHeaderView = [CollectionHeaderView collectionHeaderView];
        _topHeaderView.frame = CGRectMake(0, -(kGameHeaderViewH + kGameViewH), kScreenW, kGameHeaderViewH);
        _topHeaderView.iconImageView.image = [UIImage imageNamed:@"Img_orange"];
        _topHeaderView.titleLabel.text = @"常见";
        _topHeaderView.moreBtn.hidden = YES;
    }
    return _topHeaderView;
}

- (RecommendGameView *)gameView {
    if (!_gameView) {
        _gameView = [RecommendGameView recommendGameView];
        _gameView.frame = CGRectMake(0, -kGameViewH, kScreenW, kGameViewH);
    }
    return _gameView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

- (void)setupUI {
    self.contentView = self.collectionView;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView addSubview:self.topHeaderView];
    [self.collectionView addSubview:self.gameView];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(kGameHeaderViewH + kGameViewH, 0, 0, 0);
    
    [super setupUI];
}

- (void)loadData {
    
    [self.gameVM loadAllGameData:^{
        
        [self.collectionView reloadData];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 10)];
        
       self.gameView.groups = (NSMutableArray *)[self.gameVM.games objectsAtIndexes:indexSet];
        
        [self loadDataFinished];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gameVM.games.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionGameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGameCellID forIndexPath:indexPath];
    
    cell.baseGame = self.gameVM.games[indexPath.row];
    cell.clipsToBounds = NO;

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kGameHeaderViewID forIndexPath:indexPath];
    
    headerView.titleLabel.text = @"全部";
    headerView.iconImageView.image = [UIImage imageNamed:@"Img_orange"];
    headerView.moreBtn.hidden = YES;
    
    return headerView;
    
}




@end
