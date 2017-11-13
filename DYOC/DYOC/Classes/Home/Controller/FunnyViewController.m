//
//  FunnyViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "FunnyViewController.h"

#import "FunnyViewModel.h"

#define kFunnyTopMargin 8


@interface FunnyViewController ()

@property (nonatomic, strong) FunnyViewModel *funnyVM;

@end

@implementation FunnyViewController

- (FunnyViewModel *)funnyVM {
    if (!_funnyVM) {
        _funnyVM = [[FunnyViewModel alloc]init];
    }
    return _funnyVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setupUI {
    [super setupUI];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.headerReferenceSize = CGSizeZero;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(kFunnyTopMargin, 0, 0, 0);
}

- (void)loadData {
    
    self.baseVM = self.funnyVM;
    
    [self.funnyVM loadFunnyData:^{
        
        [self.collectionView reloadData];
        
        [self loadDataFinished];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
