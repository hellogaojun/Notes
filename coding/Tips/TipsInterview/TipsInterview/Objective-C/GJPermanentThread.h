//
//  GJPermanentThread.h
//  TipsInterview
//
//  Created by admin on 2021/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GJPermenantThreadTask)(void);

//基于runloop的线程保活
@interface GJPermanentThread : NSObject

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(GJPermenantThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
