//
//  SemaphoreDemo.h
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "GJBaseDemo.h"

NS_ASSUME_NONNULL_BEGIN

/// semaphore叫做”信号量”
///
/// 信号量的初始值，可以用来控制线程并发访问的最大数量
///
/// 信号量的初始值为1，代表同时只允许1条线程访问资源，保证线程同步

@interface SemaphoreDemo : GJBaseDemo

@end

NS_ASSUME_NONNULL_END
