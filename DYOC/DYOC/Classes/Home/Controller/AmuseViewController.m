//
//  AmuseViewController.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "AmuseViewController.h"

#import "AmuseMenuView.h"
#import "AmuseViewModel.h"

#define kMenuViewH 200

@interface AmuseViewController ()

@property (nonatomic, strong) AmuseViewModel *amuseVM;
@property (nonatomic, strong) AmuseMenuView *menuView;

@end

@implementation AmuseViewController


- (AmuseViewModel *)amuseVM {
    if (!_amuseVM) {
        _amuseVM = [[AmuseViewModel alloc]init];
    }
    return _amuseVM;
}

- (AmuseMenuView *)menuView {
    if (!_menuView) {
        _menuView = [AmuseMenuView amuseMenuView];
        _menuView.frame = CGRectMake(0, -kMenuViewH, kScreenW, kMenuViewH);
    }
    return _menuView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    
    [super setupUI];
    
    [self.collectionView addSubview:self.menuView];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(kMenuViewH, 0, 0, 0);
    
}

- (void)loadData {
    
    self.baseVM = self.amuseVM;
    
    [self.amuseVM loadAmuseData:^{
        
        [self.collectionView reloadData];
        
        NSMutableArray *tempGroups = [NSMutableArray arrayWithArray:self.amuseVM.anchorGroups];
        [tempGroups removeObjectAtIndex:0];
        self.menuView.groups = tempGroups;

        [self loadDataFinished];
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
