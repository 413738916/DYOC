//
//  UIBarButtonItem+CT.m
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "UIBarButtonItem+CT.h"

@implementation UIBarButtonItem (CT)

- (id)initWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName size:(CGSize)size {

    // 1.创建UIButton
    UIButton *btn = [[UIButton alloc]init];
    
    // 2.设置btn的图片
    [btn setImage:[UIImage imageNamed:imageName] forState:0];
    
    if (highImageName){
        [btn setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    }
    
    // 3.设置btn的尺寸
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        [btn sizeToFit];
    } else {
        btn.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
    // 4.创建UIBarButtonItem
    return  [self initWithCustomView:btn];
    
}

+ (id)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName size:(CGSize)size {
    return [[self alloc]initWithImageName:imageName highImageName:highImageName size:size];
}

@end
