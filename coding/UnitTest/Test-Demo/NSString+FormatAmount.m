//
//  NSString+FormatAmount.m
//  Test-Demo
//
//  Created by gaojun on 2019/3/13.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "NSString+FormatAmount.h"

@implementation NSString (FormatAmount)
- (NSString *)moneyFormatShow {
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    
    [currencyFormatter setPositiveFormat:@"###,##0.00;"];
    return [currencyFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
}

- (NSString *)moneyFormatShowWithInt{
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    
    [currencyFormatter setPositiveFormat:@"###,##0;"];
    return [currencyFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    
}

/**
 * 格式化金额(xxx,xxx,xx),用于显示数据 小数点后字体小
 *
 */
- (NSAttributedString *)moneyFormatZeroShow {
    NSString                    *str = [self moneyFormatShow];
    NSMutableAttributedString   *attstr = [[NSMutableAttributedString alloc]initWithString:str];
//    NSString                    *floatNum = [str substringFromIndex:[str rangeOfString:@"."].location];
    
//    [attstr setFont:[UIFont systemFontOfSize:12] string:floatNum];
    return attstr;
}

- (NSString *)moneyFormatData {
    return [NSString stringWithFormat:@"%.2f", [self doubleValue]];
}

- (NSString*)moneyFormatDataWithIntegerValue{
    
    return [NSString stringWithFormat:@"%ld", [self integerValue]];
    
}
@end
