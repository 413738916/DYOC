//
//  PageContentView.h
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageContentView;
@protocol PageContentViewDelegate <NSObject>

- (void)pageContentView:(PageContentView *)pageContentView progress:(float)progress sourceIndex:(int)sourceIndex targetIndex:(int)targetIndex;

@end

@interface PageContentView : UIView

@property (nonatomic, assign) id<PageContentViewDelegate> deldgate;

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController;

- (void)setCurrentIndex:(int)currentIndex;

@end
