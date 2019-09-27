//
//  NSLockDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
@property (strong, nonatomic) NSLock *ticketLock;
@property (strong, nonatomic) NSLock *moneyLock;
@end

@implementation NSLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__saleTicket {
    [self.ticketLock lock];
    
    [super __saleTicket];
    
    [self.ticketLock unlock];
}

- (void)__saveMoney {
    [self.moneyLock lock];
    
    [super __saveMoney];
    
    [self.moneyLock unlock];
}

- (void)__drawMoney {
    [self.moneyLock lock];
    
    [super __drawMoney];
    
    [self.moneyLock unlock];
}
@end
