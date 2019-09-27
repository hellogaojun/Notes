//
//  MutexDemo.h
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "GJBaseDemo.h"

NS_ASSUME_NONNULL_BEGIN

/// mutex叫做”互斥锁”，等待锁的线程会处于休眠状态
///
/// 需要导入头文件#import <pthread.h>

@interface MutexDemo : GJBaseDemo

@end

NS_ASSUME_NONNULL_END
