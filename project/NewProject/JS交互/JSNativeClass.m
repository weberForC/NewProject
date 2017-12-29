//
//  JSNativeClass.m
//  NewProject
//
//  Created by juanMac on 2017/12/27.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "JSNativeClass.h"

@implementation JSNativeClass

-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
//    if([message.name isEqualToString:@"evalNativeHandle"]){
//        @try{
//            NSDictionary *dict = (NSDictionary*)message.body;
//            NSString *method=[dict objectForKey:@"handleName"];
//            if(method){
//
//                if([dict objectForKey:@"param"]){
//                    method=[method stringByAppendingString:@":"];
//                    SEL selector=NSSelectorFromString(method);
//                    id param=[dict objectForKey:@"param"];
//                    [self performSelector:selector withObject:param];
//
//                }else{
//                    SEL selector=NSSelectorFromString(method);
//                    [self performSelector:selector];
//                }
//            }
//        }@catch(NSException *exc){
//            NSLog(@"err");
//        }
//    }
}

@end
