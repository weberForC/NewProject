//
//  WWYCommonNetWork.h
//  Policy
//
//  Created by app on 15/12/9.
//  Copyright © 2015年 demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWYCommonNetWork : NSObject

/**
 *  数据请求
 *
 *  @param urlstring URL
 *  @param method    get or Post
 *  @param parmas    请求参数
 *  @param files     请求文件(图片)
 *  @param success   请求成功的block
 *  @param fail      请求失败的block
 */


+ (void)requestURL:(NSString *)requestURL
        httpMethod:(NSString *)method
            params:(NSDictionary *)parmas
              file:(NSDictionary *)files
           success:(void (^)(id data))success
              fail:(void (^)(NSError *error))fail;

@end
