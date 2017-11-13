//
//  BaseAnchorViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseAnchorViewController.h"

#import "CollectionHeaderView.h"
#import "CollectionNormalCell.h"
#import "BaseViewModel.h"
#import "AnchorGroup.h"
#import "AnchorModel.h"

#import "RoomShowViewController.h"
#import "RoomNormalViewController.h"

@interface BaseAnchorViewController ()

@end

@implementation BaseAnchorViewController

- (BaseViewModel *)baseVM {
    if (!_baseVM) {
        _baseVM = [[BaseViewModel alloc]init];
    }
    return _baseVM;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 1.创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(kNormalItemW, kNormalItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = kItemMargin;
        layout.headerReferenceSize = CGSizeMake( kScreenW, kHeaderViewH);
        layout.sectionInset = UIEdgeInsetsMake( 0, kItemMargin, 0,kItemMargin);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionNormalCell" bundle:nil] forCellWithReuseIdentifier:kNormalCellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionPrettyCell" bundle:nil] forCellWithReuseIdentifier:kPrettyCellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewID];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

- (void)setupUI {
    
    self.contentView = self.collectionView;
    
    [self.view addSubview:self.collectionView];
    
    [super setupUI];
    
}

- (void)loadData{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.baseVM.anchorGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    AnchorGroup *group = self.baseVM.anchorGroups[section];
    return group.anchors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     CollectionNormalCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:kNormalCellID forIndexPath:indexPath];
    
    AnchorGroup *group = self.baseVM.anchorGroups[indexPath.section];
    cell.anchor = group.anchors[indexPath.row];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewID forIndexPath:indexPath];
    
    headerView.group = self.baseVM.anchorGroups[indexPath.section];
    
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AnchorGroup *group = self.baseVM.anchorGroups[indexPath.section];
    AnchorModel *anchor = group.anchors[indexPath.item];
    
    if ( anchor.isVertical == 0) {
        [self.navigationController pushViewController:[[RoomNormalViewController alloc]init] animated:YES];
    }
    else {
        [self presentViewController:[[RoomShowViewController alloc]init] animated:YES completion:nil];
    }
    
}





@end
