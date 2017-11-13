//
//  HttpTool.h
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HttpTool :  NSObject

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView;

@end
