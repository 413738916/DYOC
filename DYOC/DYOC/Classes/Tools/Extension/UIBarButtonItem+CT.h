//
//  UIBarButtonItem+CT.h
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CT)

- (id)initWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName size:(CGSize)size;

+ (id)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName size:(CGSize)size;

@end
