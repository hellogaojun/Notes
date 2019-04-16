//
//  NSString+FormatAmount.h
//  Test-Demo
//
//  Created by gaojun on 2019/3/13.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FormatAmount)
#pragma mark - 金额

/**
 *  格式化金额(xxx,xxx,xx),用于显示数据
 */
- (NSString *)moneyFormatShow;

- (NSString *)moneyFormatShowWithInt;

/**
 *  格式化金额，保留2位小数，用于计算数据
 */
- (NSString *)moneyFormatData;

// 金额取整

- (NSString*)moneyFormatDataWithIntegerValue;

/**
 * 格式化金额(xxx,xxx,xx),用于显示数据 小数点后字体小
 *
 */
-(NSAttributedString *)moneyFormatZeroShow;
@end

NS_ASSUME_NONNULL_END
