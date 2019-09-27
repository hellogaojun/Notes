//
//  NSLockConditionLockDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "NSLockConditionLockDemo.h"

@interface NSLockConditionLockDemo ()
@property (strong, nonatomic) NSConditionLock *conditionLock;
@end

@implementation NSLockConditionLockDemo

- (instancetype)init {
    if (self = [super init]) {
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one {
    [self.conditionLock lock];
    
    NSLog(@"__one");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two {
    BOOL isSuc = [self.conditionLock tryLockWhenCondition:666];
    NSLog(@"条件666加锁%@",isSuc ? @"成功" : @"失败");
    
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"__two");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)__three {
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"__three");
    
    [self.conditionLock unlock];
}

@end
