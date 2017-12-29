//
//  JSNativeClass.h
//  NewProject
//
//  Created by juanMac on 2017/12/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface JSNativeClass : NSObject<WKScriptMessageHandler>
@property (weak, nonatomic) id delegate;
@property (weak, nonatomic) id webview;

@end
