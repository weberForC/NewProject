//
//  CommonTools.h
//  Text
//
//  Created by JuanCT on 2017/10/11.
//  Copyright © 2017年 JUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@interface CommonTools : NSObject<MBProgressHUDDelegate>
{
    MBProgressHUD * HUDBox;
}

+(UIFont *)myFont:(CGFloat)myfont;                 //字体大小适配
+(NSString *)md5Str:(NSString *)string;            //MD5
+(NSString *)base64Str:(NSString *)string;         //base64
-(void)setHUDWithTextStr:(NSString *)text;         //alert
+(NSString *)overturnString:(NSString *)string;    //翻转

@end
