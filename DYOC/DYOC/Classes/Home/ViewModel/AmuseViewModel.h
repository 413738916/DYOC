//
//  AmuseViewModel.h
//  DYOC
//
//  Created by 123 on 2017/11/9.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "BaseViewModel.h"

@interface AmuseViewModel : BaseViewModel

- (void)loadAmuseData:(void (^) ())sucess;

@end
