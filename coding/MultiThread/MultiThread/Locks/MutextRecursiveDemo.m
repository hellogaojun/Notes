//
//  MutextRecursiveDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "MutextRecursiveDemo.h"
#import <pthread.h>

@interface MutextRecursiveDemo ()
@property (nonatomic, assign) pthread_mutex_t mutex;
@end
@implementation MutextRecursiveDemo

- (void)__initMutex:(pthread_mutex_t *)mutex {
    //递归锁：允许同一个线程对一把锁进行重复加锁
    
    //初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    //初始化锁
    pthread_mutex_init(mutex,&attr);
    
    //销毁属性
    pthread_mutexattr_destroy(&attr);
}

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_mutex];
    }
    return self;
}

- (void)otherTest {
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    
    static int count = 0;
    if (count < 10) {
        count++;
        [self otherTest];
    }
    
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
}

@end
