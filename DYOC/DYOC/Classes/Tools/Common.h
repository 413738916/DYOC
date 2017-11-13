//
//  Common.h
//  DYOC
//
//  Created by 123 on 2017/11/2.
//  Copyright © 2017年 ct. All rights reserved.
//

#ifndef Common_h
#define Common_h

/*
 *日志输出
 */
#ifdef DEBUG
//调试状态
#define MyLog(...) NSLog(__VA_ARGS__)

#else
//发布状态
#define MyLog(...)

#endif

#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height

//获得RGB颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define KRandomColor kColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define kStatusBarH  20
#define kNavigationBarH  44
#define kTabbarH  44

//首页
#define kItemMargin 10
#define kHeaderViewH 50

#define kNormalCellID @"kNormalCellID"
#define kHeaderViewID @"kHeaderViewID"
#define kPrettyCellID @"kPrettyCellID"

#define  kNormalItemW (kScreenW - 3 * kItemMargin) / 2
#define  kNormalItemH kNormalItemW * 3 / 4
#define  kPrettyItemH kNormalItemW * 4 / 3

#endif /* Common_h */
