//
//  GJModel.m
//  Test-Demo
//
//  Created by gaojun on 2019/3/13.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "GJModel.h"

@implementation GJModel
- (NSInteger)randomLessThanTen {
    return arc4random() % 10;
}


- (BOOL)isValidAmountStr:(NSString *)amountStr {
    if (amountStr.length < 1) {
        return NO;
    }
    for (int i = 0; i < amountStr.length; i++) {
        int assciiCode = [amountStr characterAtIndex:i];
        if (assciiCode > 57 || (assciiCode < 48 && assciiCode != 46) ) {
            return NO;
        }
    }
    
    NSArray *tempArr = [amountStr componentsSeparatedByString:@"."];
    if (tempArr.count > 2) {
        return NO;
        
    } else {
        NSRange range = [amountStr rangeOfString:@"."];
        if (range.location == NSNotFound) {
            return amountStr.length ? YES : NO;
            
        } else {
            if (range.location == 0) {
                return NO;
            }
            
            NSString *tempStr2 = [amountStr substringFromIndex:range.location + range.length];
            if (tempStr2.length > 0 && tempStr2.length <= 2) {
                return YES;
            }
            return NO;
        }
    }
    return NO;
}


- (BOOL)isValidAmountStr2:(NSString *)amountStr2 {
    NSString * regex = @"^[0-9]+(.[0-9]{1,2})?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:amountStr2];
    
    return isMatch;
}

@end
