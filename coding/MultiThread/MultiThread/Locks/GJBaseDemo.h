//
//  GJBaseDemo.h
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 1块资源可能会被多个线程共享，也就是多个线程可能会访问同一块资源
/// 比如多个线程访问同一个对象、同一个变量、同一个文件

/// 当多个线程访问同一块资源时，很容易引发数据错乱和数据安全问题

/// 解决方案：使用线程同步技术（同步，就是协同步调，按预定的先后次序进行）
/// 常见的线程同步技术是：加锁

///
/// 用于演示多线程安全问题
@interface GJBaseDemo : NSObject

/// 演示存钱/取钱
- (void)moneyTest;

/// 演示卖票
- (void)ticketTest;

/// 测试其他情况
- (void)otherTest;

#pragma mark - 子类化使用

/// 存钱
- (void)__saveMoney;

/// 取钱
- (void)__drawMoney;

/// 卖票(1张)
- (void)__saleTicket;

@end

NS_ASSUME_NONNULL_END
