//
//  BaseAnchorViewController.h
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseViewController.h"

@class BaseViewModel;
@interface BaseAnchorViewController : BaseViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) BaseViewModel *baseVM;

- (void)loadData;

@end
