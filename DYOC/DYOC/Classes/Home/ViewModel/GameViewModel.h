//
//  GameViewModel.h
//  DYOC
//
//  Created by 123 on 2017/11/9.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *games;

- (void)loadAllGameData:(void (^) ())sucess;

@end
