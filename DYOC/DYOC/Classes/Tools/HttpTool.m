//
//  HttpTool.m
//  DYOC
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "HttpTool.h"

#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@implementation HttpTool

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success == nil) { return ; }
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure == nil) return;
        failure(error);
    }];
    
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success == nil) { return ; }
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure == nil) return;
        failure(error);
    }];

}


+(void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView {
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:place options:SDWebImageLowPriority | SDWebImageRetryFailed];
}

@end
