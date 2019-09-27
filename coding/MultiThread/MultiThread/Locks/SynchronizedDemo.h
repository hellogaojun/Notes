//
//  SynchronizedDemo.h
//  MultiThread
//
//  Created by bfd on 2019/9/21.
//  Copyright © 2019 GJ. All rights reserved.
//

#import "GJBaseDemo.h"

NS_ASSUME_NONNULL_BEGIN

/// @synchronized是对mutex递归锁的封装
///
/// 源码可参考：objc4中的objc-sync.mm文件
///
///@synchronized(obj)内部会生成obj对应的递归锁，然后进行加锁、解锁操作

@interface SynchronizedDemo : GJBaseDemo

@end

NS_ASSUME_NONNULL_END
