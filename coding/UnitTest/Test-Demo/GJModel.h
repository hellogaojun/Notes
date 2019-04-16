//
//  GJModel.h
//  Test-Demo
//
//  Created by gaojun on 2019/3/13.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJModel : NSObject

- (NSInteger)randomLessThanTen;

- (BOOL)isValidAmountStr:(NSString *)amountStr;

- (BOOL)isValidAmountStr2:(NSString *)amountStr2;

@end

NS_ASSUME_NONNULL_END
