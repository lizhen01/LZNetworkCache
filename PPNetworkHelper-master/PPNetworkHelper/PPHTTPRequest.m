//
//  PPHTTPRequest.m
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPHTTPRequest.h"
#import "PPInterfacedConst.h"
#import "PPNetworkHelper.h"

@implementation PPHTTPRequest
/** 登录*/
+ (NSURLSessionTask *)getLoginWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    // 将请求前缀与请求路径拼接成一个完整的URL
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kLogin];
    return [self requestWithCacheOfURL:url parameters:parameters isHaveHTTPHeader:NO responseCache:nil success:success failure:failure];
}
/** 退出*/
+ (NSURLSessionTask *)getExitWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kExit];
    return [self requestWithCacheOfURL:url parameters:parameters isHaveHTTPHeader:NO responseCache:nil success:success failure:failure];
}

+(NSURLSessionTask *)getMainPageWithParameters:(id)parameters responCache:(PPHttpRequestCache)cache success:(PPRequestSuccess)success failure:(PPRequestFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kLogin];
    return [self requestWithCacheOfURL:url parameters:parameters isHaveHTTPHeader:YES responseCache:cache success:success failure:failure];
}











































/*
 配置好PPNetworkHelper各项请求参数,封装成一个公共方法,给以上方法调用,
 相比在项目中单个分散的使用PPNetworkHelper/其他网络框架请求,可大大降低耦合度,方便维护
 在项目的后期, 你可以在公共请求方法内任意更换其他的网络请求工具,切换成本小
 */

#pragma mark - 请求的公共方法

/**
 带 token 的 POST 请求方法  
 
 @param isHaveHeader  有请求头的 传YES  否者 传入NO；
 
 @param cache 不需要cache时 可传nil；
 
 @param extInfo 扩展信息
 */
+(NSURLSessionTask *)requestWithCacheOfURL:(NSString *)URL parameters:(NSDictionary *)parameter isHaveHTTPHeader:(BOOL)isHaveHeader responseCache:(PPHttpRequestCache)cache success:(PPRequestSuccess)success failure:(PPRequestFailure)failed{
    if (isHaveHeader == YES) {//添加请求头
        [PPNetworkHelper setValue:@"1" forHTTPHeaderField:@"token"];//请求头
    }else{}
    
    return [PPNetworkHelper POST:URL parameters:parameter responseCache:^(id responseCache) {
        cache(responseCache);
    } success:^(id responseObject) {
        //在此处处理重复的操作（提示框，判断返回状态。。。。。。。）
        success(responseObject);
    } failure:^(NSError *error) {
        failed(error);
    }];
}

@end
