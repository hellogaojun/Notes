//
//  MultiReadSingleWrite.h
//  MultiThread
//
//  Created by bfd on 2019/9/27.
//  Copyright © 2019 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 多读单写
///
/// 同一时间，只能有1个线程进行写的操作
///
/// 同一时间，允许有多个线程进行读的操作
///
/// 同一时间，不允许既有写的操作，又有读的操作
///
/// 解决方案：1.pthread_rwlock：读写锁 2.dispatch_barrier_async：异步栅栏调用
 
@interface MultiReadSingleWrite : NSObject

/// 基于读写锁的方案
- (void)method_pthread_rwlock;

/// 基于异步栅栏的方案
- (void)method_dispatch_barrier_async;

@end

NS_ASSUME_NONNULL_END
