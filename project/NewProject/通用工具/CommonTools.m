//
//  CommonTools.m
//  Text
//
//  Created by JuanCT on 2017/10/11.
//  Copyright © 2017年 JUAN. All rights reserved.
//

#import "CommonTools.h"
#import<CommonCrypto/CommonDigest.h>

@implementation CommonTools

+(UIFont *)myFont:(CGFloat)myfont{
    if (IS_IPHONE_5) {
        UIFont *newFont = [UIFont systemFontOfSize:myfont-2];
        return newFont;
    }else if (IS_IPHONE_4_OR_LESS){
        UIFont *newFont = [UIFont systemFontOfSize:myfont-4];
        return newFont;
    }else{
        UIFont *newFont = [UIFont systemFontOfSize:myfont];
        return newFont;
    }
}

+(NSString *)md5Str:(NSString *)string
{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

+(NSString *)base64Str:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

+(NSString *)overturnString:(NSString *)string
{
    //length 计算字符串的长度
    NSInteger length = string.length;
    
    ///取出一个字符串中的每一个字符
    unichar *buffer = calloc(length, sizeof(unichar));
    
    ///翻转字符串的长度
    [string getCharacters:buffer range:NSMakeRange(0, length)];
    
    for (NSInteger i = 0; i<length/2; i++)
    {
        unichar temp = buffer[i];
        buffer[i] = buffer[length-1-i];
        buffer[length-1-i] = temp;
    }
    
    ///得到翻转之后的字符串
    NSString *result = [NSString stringWithCharacters:buffer length:length];
    
    //释放对象
    free(buffer);
    return result;
}

// 设置弹出框
-(void)setHUDWithTextStr:(NSString *)text
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    HUDBox = [[MBProgressHUD alloc]initWithView:app.window];
    [app.window addSubview:HUDBox];
    HUDBox.customView = [[UIImageView alloc]initWithImage:nil];
    HUDBox.mode = MBProgressHUDModeCustomView;
    HUDBox.delegate = self;
    HUDBox.labelText = text;
    [HUDBox show:YES];
    [HUDBox hide:YES afterDelay:1.5];
    
}

@end
