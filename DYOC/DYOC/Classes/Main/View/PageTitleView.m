//
//  PageTitleView.m
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "PageTitleView.h"

#define kScrollLineH 2

#define kNormalColorR 85
#define kNormalColorG 85
#define kNormalColorB 85

#define kSelectColorR 255
#define kSelectColorG 128
#define kSelectColorB 0

@interface PageTitleView ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, strong) NSMutableArray *titleLabels;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollLine;

@end

@implementation PageTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
       
        self.titles = titles;
        
        _titleLabels = [NSMutableArray array];
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    // 1.添加UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.bounces = NO;
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    _scrollView = scrollView;
    
    // 2.添加title对应的Label
    [self setupTitleLabels];

    // 3.设置底线和滚动的滑块
    [self setupBottomLineAndScrollLine];
}

- (void)setupTitleLabels {
    
    // 0.确定label的一些frame的值
    CGFloat labelW = self.frame.size.width / _titles.count;
    CGFloat labelH = self.frame.size.height - kScrollLineH;
    CGFloat labelY = 0;
    
    for (int i = 0; i < _titles.count; i++) {
        
        UILabel *label = [[UILabel alloc]init];
        label.text = _titles[i];
        label.tag = i;
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = kColor(kNormalColorR, kNormalColorG, kNormalColorB);
        label.textAlignment = NSTextAlignmentCenter;
        
        CGFloat labelX = labelW * i;
        label.frame = CGRectMake( labelX,  labelY,  labelW, labelH);

        [_scrollView addSubview:label];
        [_titleLabels addObject:label];
        
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleLabelClick:)];
        tapGes.numberOfTapsRequired = 1;
        tapGes.numberOfTouchesRequired = 1;
        [label addGestureRecognizer:tapGes];
    }
    
}

- (void)setupBottomLineAndScrollLine {
 
    UIView *bottomLine = [[UIView alloc]init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    CGFloat lineH = 0.5;
    bottomLine.frame = CGRectMake(0, self.frame.size.height - lineH, self.frame.size.width,lineH);
    [self addSubview:bottomLine];

    UILabel *firstLable = (UILabel *)_titleLabels.firstObject;
    firstLable.textColor = kColor(kSelectColorR, kSelectColorG, kSelectColorB);
   
    UIView *scrollLine = [[UIView alloc]init];
    scrollLine.backgroundColor = [UIColor orangeColor];
    scrollLine.frame = CGRectMake(firstLable.frame.origin.x, self.frame.size.height - kScrollLineH,  firstLable.frame.size.width, kScrollLineH);
    [_scrollView addSubview:scrollLine];
    _scrollLine = scrollLine;
}

- (void)titleLabelClick:(UITapGestureRecognizer *)tapGes {
    
    // 0.获取当前Label
    UILabel *currentLabel = (UILabel *)tapGes.view;
    if (!currentLabel) { return; }
    
    // 1.如果是重复点击同一个Title,那么直接返回
    if (currentLabel.tag == _currentIndex) { return; }
    
    // 2.获取之前的Label
    UILabel *oldLabel = (UILabel *)_titleLabels[_currentIndex];
    
    // 3.切换文字的颜色
    currentLabel.textColor = kColor(kSelectColorR, kSelectColorG, kSelectColorB);
    oldLabel.textColor = kColor(kNormalColorR, kNormalColorG, kNormalColorB);
    
    // 4.保存最新Label的下标值
    _currentIndex = (int)currentLabel.tag;
    
    // 5.滚动条位置发生改变
    CGFloat scrollLineX = _currentIndex * _scrollLine.frame.size
    .width;
    [UIView animateWithDuration:0.15 animations:^{
        CGRect frame = self.scrollLine.frame;
        frame.origin.x = scrollLineX;
        self.scrollLine.frame = frame;
    }];
    
    // 6.通知代理
    if ([_delegate respondsToSelector:@selector(pageTitleView:selectedIndex:)]) {
        [_delegate pageTitleView:self selectedIndex:_currentIndex];
    }
}


- (void)setTitleWithProgress:(float)progress sourceIndex:(int)sourceIndex targetIndex:(int)targetIndex {
    
    // 1.取出sourceLabel/targetLabel
    UILabel *sourceLabel = (UILabel *)_titleLabels[sourceIndex];
    UILabel *targetLabel = (UILabel *)_titleLabels[targetIndex];
    
    // 2.处理滑块的逻辑
    float moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x;
    float moveX = moveTotalX * progress;
    CGRect frame = _scrollLine.frame;
    frame.origin.x = sourceLabel.frame.origin.x + moveX;
    _scrollLine.frame = frame;
    
    // 3.颜色的渐变(复杂)
    // 3.1.取出变化的范围
    float colorDeltaR = kSelectColorR - kNormalColorR;
    float colorDeltaG = kSelectColorG - kNormalColorG;
    float colorDeltaB = kSelectColorB - kNormalColorB;
    
    // 3.2.变化sourceLabel
    sourceLabel.textColor = kColor(kSelectColorR - colorDeltaR * progress, kSelectColorG - colorDeltaG * progress, kSelectColorB - colorDeltaB * progress);
    // 3.2.变化targetLabel
    targetLabel.textColor = kColor(kNormalColorR + colorDeltaR * progress, kNormalColorG + colorDeltaG * progress, kNormalColorB + colorDeltaB * progress);
    
    // 4.记录最新的index
    _currentIndex = targetIndex;
    
}




@end
