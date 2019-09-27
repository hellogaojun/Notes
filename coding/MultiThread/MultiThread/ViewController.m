//
//  ViewController.m
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "ViewController.h"
#import "GJBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "SemaphoreDemo.h"
#import "SerialQueueDemo.h"
#import "SynchronizedDemo.h"
#import "MutexDemo.h"
#import "MutextRecursiveDemo.h"
#import "MutextConditionDemo.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSLockConditionLockDemo.h"

@interface ViewController ()
@property (nonatomic, strong) GJBaseDemo *demo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GJBaseDemo *demo = [NSLockConditionLockDemo new];
    self.demo = demo;
//    [demo ticketTest];
//    [demo moneyTest];
//    [demo otherTest];
    
}


- (void)referenceNote {
    /**
     iOS线程同步方案性能比较(从高到低)
     ** os_unfair_lock
     ** OSSpinLock
     ** dispatch_semaphore
     ** pthread_mutex
     ** dispatch_queue(DISPATCH_SERIAL)
     ** NSLock
     ** NSCondition
     ** pthread_mutext(recursive)
     ** NSRecursiveLock
     ** NSConditionLock
     ** @synchronized
     */
    
    //推荐使用方案：dispatch_semaphore || pthread_mutex
    
    /**
     自旋锁，互斥锁比较：
     1.何时使用自旋锁
     ** 预计线程等待锁的时间很短
     ** 加锁的代码（临界区）经常被调用，但竞争情况很少发生
     ** CPU资源不紧张
     ** 多核处理器
     
     2.何时使用互斥锁
     ** 预计等待线程的时间比较长
     ** 单核处理器
     ** 临界区有IO操作
     ** 临界区代码复杂或者循环量大
     ** 临界区代码竞争非常激烈
     
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.demo otherTest];
//    [self.demo ticketTest];
//    [self.demo moneyTest];
}

- (void)test {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"******----%@",[NSThread currentThread]);
        dispatch_queue_t serialQueue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
        for (int i = 0; i < 10; i++) {
            dispatch_async(serialQueue, ^{
                NSLog(@"test----%@",[NSThread currentThread]);
            });
        }
    });
}

@end
