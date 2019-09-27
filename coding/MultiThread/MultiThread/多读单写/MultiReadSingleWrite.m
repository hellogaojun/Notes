//
//  MultiReadSingleWrite.m
//  MultiThread
//
//  Created by bfd on 2019/9/27.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "MultiReadSingleWrite.h"
#import <pthread.h>

@interface MultiReadSingleWrite ()
@property (strong, nonatomic) dispatch_queue_t customQueue;
@property (strong, nonatomic) dispatch_queue_t globalQueue;

@property (assign, nonatomic) pthread_rwlock_t lock;


@end
@implementation MultiReadSingleWrite

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - pthread_rwlock

- (void)method_pthread_rwlock {
    self.globalQueue = dispatch_get_global_queue(0, 0);
    pthread_rwlock_init(&_lock, NULL);
    for (int i = 0; i < 10; i++) {
       dispatch_async(self.globalQueue, ^{
           [self rwlock_read];
       });
        dispatch_async(self.globalQueue, ^{
            [self rwlock_read];
        });
        dispatch_async(self.globalQueue, ^{
            [self rwlock_read];
        });
       dispatch_async(self.globalQueue, ^{
           [self rwlock_write];
       });
       }
}

- (void)rwlock_read {
    pthread_rwlock_rdlock(&_lock);
    
    sleep(2);
    NSLog(@"read---%@",[NSRunLoop currentRunLoop]);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)rwlock_write {
    pthread_rwlock_wrlock(&_lock);
    
    sleep(2);
    NSLog(@"write");
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc {
    pthread_rwlock_destroy(&_lock);
}

#pragma mark - dispatch_barrier_async

- (void)method_dispatch_barrier_async {
    //并发队列必须是自己通过dispatch_queue_cretate创建的
    //如果传入的是一个串行或是一个全局的并发队列，那这个函数便等同于dispatch_async函数的效果

    self.customQueue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_async(self.customQueue, ^{
            [self barrier_read];
        });
        
        dispatch_async(self.customQueue, ^{
            [self barrier_read];
        });
        
        dispatch_async(self.customQueue, ^{
            [self barrier_read];
        });
        
        dispatch_barrier_async(self.customQueue, ^{
            [self barrier_write];
        });
    }
}

- (void)barrier_read {
    sleep(2);
    NSLog(@"read");
}

- (void)barrier_write {
    sleep(2);
    NSLog(@"write");
    
}

@end
