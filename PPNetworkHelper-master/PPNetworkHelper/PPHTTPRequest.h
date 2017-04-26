//
//  PPHTTPRequest.h
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 以下Block的参数你根据自己项目中的需求来指定, 这里仅仅是一个演示的例子
 */

/**
 请求成功的block
 
 @param info     返回信息
 @param response 响应体数据
 */
typedef void(^PPRequestSuccess)(id response);
/**
 请求失败的block
 
 @param extInfo 扩展信息
 */
typedef void(^PPRequestFailure)(NSError *error);
/**
 缓存的Block
 
 @param extInfo 扩展信息
 */
typedef void(^PPHttpRequestCache)(id responseCache);

@interface PPHTTPRequest : NSObject

/*在此写所有接口的方法，在VC中只调用此处的类方法*/

/** 登录*/
+ (NSURLSessionTask *)getLoginWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure;
/** 退出*/
+ (NSURLSessionTask *)getExitWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure;

/** 首页请求*/
+ (NSURLSessionTask *)getMainPageWithParameters:(id)parameters responCache:(PPHttpRequestCache)cache success:(PPRequestSuccess)success failure:(PPRequestFailure)failure;

@end
