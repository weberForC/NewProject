//
//  UserDefaults.h
//  ienterprise99
//
//  Created by juan on 16/10/17.
//  Copyright © 2016年 juan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject

//封装  对NSUserDefaults的读取操作
+ (void)saveValue:(id)value forKey:(NSString *)key;
+ (id)getValueForKey:(NSString *)key;
+ (void)removeValueForKey:(NSString *)key;

//单利,保存网络请求的图片
+ (instancetype)sharedDataTool;


@end
