//
//  OSSpinLockDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>
@interface OSSpinLockDemo ()
@property (nonatomic, assign) OSSpinLock moneyLock;
@property (nonatomic, assign) OSSpinLock ticketLock;

@end
@implementation OSSpinLockDemo
- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__saleTicket {
    OSSpinLockLock(&_ticketLock);
    
    [super __saleTicket];
    
    OSSpinLockUnlock(&_ticketLock);
}

- (void)__saveMoney {
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__drawMoney {
    OSSpinLockLock(&_moneyLock);
    
    [super __drawMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

@end
