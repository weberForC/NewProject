//
//  WWYCommonNetWork.m
//  Policy
//
//  Created by app on 15/12/9.
//  Copyright © 2015年 demo. All rights reserved.
//

#import "WWYCommonNetWork.h"

@implementation WWYCommonNetWork

+ (void)requestURL:(NSString *)requestURL
        httpMethod:(NSString *)method
            params:(NSDictionary *)parmas
              file:(NSDictionary *)files
           success:(void (^)(id data))success
              fail:(void (^)(NSError *error))fail
{
    //1.构造操作对象管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //2.设置解析格式，默认json
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil]];
    //3.判断网络状况
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];  //开始监听
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            NSLog(@"没有网络");
            SHOWALERT(@"当前没有网络，请检查网络设置");
            fail(nil);
            return;
        }else if (status == AFNetworkReachabilityStatusUnknown){
            
            //NSLog(@"未知网络");
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            
            //NSLog(@"WiFi");
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            
            //NSLog(@"手机网络");
            
        }
    }];
    
    // 4.get请求
    if ([[method uppercaseString] isEqualToString:@"GET"]) {
        [manager GET:requestURL
          parameters:parmas
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 if (success != nil)
                 {
                     success(responseObject);
                 }
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 if (fail != nil) {
                     fail(error);
                 }
             }];
        
        // 5.post请求不带文件 和post带文件
    }else if ([[method uppercaseString] isEqualToString:@"POST"]) {
        if (files == nil) {
            [manager POST:requestURL
               parameters:parmas
                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                      //NSLog(@"%@", operation.responseString);
                      if (success) {
                          success(responseObject);
                      }
                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                      //NSLog(@"%@", operation.responseString);
                      if (fail) {
                          fail(error);
                      }
                  }];
        } else {
            [manager POST:requestURL
               parameters:parmas constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                   for (id key in files) {
                       
                       id value = files[key];
                       //  NSLog(@"a====%@,b=====%@",key,value);
                       [formData appendPartWithFileData:value
                                                   name:key
                                               fileName:@"test.png"
                                               mimeType:@"image/png"];
                   }
               } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   if (success) {
                       success(responseObject);
                   }
               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   if (fail) {
                       fail(error);
                   }
               }];
        }
    }
}


@end
