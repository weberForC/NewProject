//
//  NSString+SHA1.m
//  ienterprise99
//
//  Created by juan on 16/10/26.
//  Copyright © 2016年 juan. All rights reserved.
//

#import "NSString+SHA1.h"

@implementation NSString (SHA1)
- (id)sha1
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}
@end
