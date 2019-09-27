//
//  SemaphoreDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "SemaphoreDemo.h"

@interface SemaphoreDemo ()
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_semaphore_t ticketSemphore;
@property (nonatomic, strong) dispatch_semaphore_t moneySemphore;
@end
@implementation SemaphoreDemo

- (instancetype)init {
    if (self = [super init]) {
        //初始化信号量
        self.semaphore = dispatch_semaphore_create(5);
        self.ticketSemphore = dispatch_semaphore_create(1);
        self.moneySemphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)__saveMoney {
    dispatch_semaphore_wait(self.moneySemphore, DISPATCH_TIME_FOREVER);
    [super __saveMoney];
    dispatch_semaphore_signal(self.moneySemphore);
}

- (void)__drawMoney {
    dispatch_semaphore_wait(self.moneySemphore, DISPATCH_TIME_FOREVER);
    [super __drawMoney];
    dispatch_semaphore_signal(self.moneySemphore);
}

- (void)__saleTicket {
    dispatch_semaphore_wait(self.ticketSemphore, DISPATCH_TIME_FOREVER);
    [super __saleTicket];
    dispatch_semaphore_signal(self.ticketSemphore);
}


- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

- (void)test {
    // 如果信号量的值 > 0，就让信号量的值减1，然后继续往下执行代码
    // 如果信号量的值 <= 0,就让线程休眠等待，直到信号量的值 > 0,就让信号量的值减1，然后继续往下执行代码
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    sleep(2);
    NSLog(@"test---%@",[NSThread currentThread]);
    // 让信号量的值 + 1
    dispatch_semaphore_signal(self.semaphore);
}

@end
