//
//  PageTitleView.h
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageTitleView;
@protocol PageTitleViewDelegate <NSObject>

- (void)pageTitleView:(PageTitleView *)pageTitleView selectedIndex:(int)index;

@end

@interface PageTitleView : UIView

@property (nonatomic, assign) id<PageTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

- (void)setTitleWithProgress:(float)progress sourceIndex:(int)sourceIndex targetIndex:(int)targetIndex;

@end
