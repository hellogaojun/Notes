//
//  GJBaseDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "GJBaseDemo.h"

@interface GJBaseDemo ()
@property (nonatomic, assign) NSUInteger money;
@property (nonatomic, assign) NSUInteger ticketsCount;

@end
@implementation GJBaseDemo

- (void)otherTest {}

/// 演示存钱/取钱
- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
           for (int i = 0; i < 10; i++) {
               [self __drawMoney];
           }
       });
}

/// 演示卖票
- (void)ticketTest {
    self.ticketsCount = 20;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 4; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            [self __saleTicket];
        }
    });
    
    
}

/// 存钱
- (void)__saveMoney {
    NSUInteger oldMoney = self.money;
    sleep(.6);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存50,当前剩余%zd---%@",oldMoney,[NSThread currentThread]);
}

/// 取钱
- (void)__drawMoney {
    NSUInteger oldMoney = self.money;
    sleep(.6);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20,当前剩余%zd---%@",oldMoney,[NSThread currentThread]);
}

/// 卖票(1张)
- (void)__saleTicket {
    NSUInteger restTicketsCount = self.ticketsCount;
    sleep(.6);
    restTicketsCount--;
    self.ticketsCount = restTicketsCount;
    NSLog(@"剩余%zd张票---%@",restTicketsCount,[NSThread currentThread]);
}

@end
