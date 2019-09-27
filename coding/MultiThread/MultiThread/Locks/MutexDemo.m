//
//  MutexDemo.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo ()
@property (nonatomic, assign) pthread_mutex_t moneyMutex;
@property (nonatomic, assign) pthread_mutex_t ticketMutext;

@end

@implementation MutexDemo

- (instancetype)init {
    if (self = [super init]) {
//        //初始化锁的属性
//        pthread_mutexattr_t attr;
//        pthread_mutexattr_init(&attr);
//        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
//
//        //初始化锁
//        pthread_mutex_t mutex;
//        pthread_mutex_init(&mutex, &attr);
//
//        //尝试加锁
//        pthread_mutex_trylock(&mutex);
//
//        //加锁
//        pthread_mutex_lock(&mutex);
//
//        //解锁
//        pthread_mutex_unlock(&mutex);
//
//        //释放相关资源
//        pthread_mutexattr_destroy(&attr);
//        pthread_mutex_destroy(&mutex);
        
        pthread_mutex_init(&_moneyMutex, NULL);
        pthread_mutex_init(&_ticketMutext, NULL);
    }
    return self;
}

- (void)__saveMoney {
    pthread_mutex_lock(&_moneyMutex);
    
    [super __saveMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_moneyMutex);
    
    [super __drawMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__saleTicket {
    pthread_mutex_lock(&_ticketMutext);
    
    [super __saleTicket];
    
    pthread_mutex_unlock(&_ticketMutext);
}

- (void)dealloc {
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutext);
}

@end
