//
//  SynchronizedDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "SynchronizedDemo.h"

@implementation SynchronizedDemo

- (void)__saveMoney {
    @synchronized (self) {
        [super __saveMoney];
    }
}

- (void)__drawMoney {
    @synchronized (self) {
        [super __drawMoney];
    }
}

- (void)__saleTicket {
    static NSObject *lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc]init];
    });
    @synchronized (lock) {
        [super __saleTicket];
    }
}


- (void)otherTest {
    @synchronized (self) {
        NSLog(@"test---123");
        [self otherTest];
    }
}

@end
