//
//  OSUnfairLockDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()
@property (nonatomic, assign) os_unfair_lock moneyLock;
@property (nonatomic, assign) os_unfair_lock ticketLock;
@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    if (@available(iOS 10.0, *)) {
        os_unfair_lock_lock(&_moneyLock);
        
        [super __saveMoney];
        
        os_unfair_lock_unlock(&_moneyLock);
    }
    
}

- (void)__drawMoney {
    if (@available(iOS 10.0, *)) {
           os_unfair_lock_lock(&_moneyLock);
           
           [super __drawMoney];
           
           os_unfair_lock_unlock(&_moneyLock);
       }
}

- (void)__saleTicket {
    if (@available(iOS 10.0, *)) {
           os_unfair_lock_lock(&_ticketLock);
           
           [super __saleTicket];
           
           os_unfair_lock_unlock(&_ticketLock);
       }
}

@end
