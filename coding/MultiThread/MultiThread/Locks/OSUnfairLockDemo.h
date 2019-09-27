//
//  OSUnfairLockDemo.h
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "GJBaseDemo.h"

NS_ASSUME_NONNULL_BEGIN

/// os_unfair_lock用于取代不安全的OSSpinLock ，从iOS10开始才支持
///
/// 从底层调用看，等待os_unfair_lock锁的线程会处于休眠状态，并非忙等
/// 
/// 需要导入头文件#import <os/lock.h>

@interface OSUnfairLockDemo : GJBaseDemo

@end

NS_ASSUME_NONNULL_END
