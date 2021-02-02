//
//  GJNotificationCenter.h
//  TipOne
//
//  Created by admin on 2021/1/29.
//

#import <Foundation/Foundation.h>

typedef NSString *GJNotificationName NS_EXTENSIBLE_STRING_ENUM;

NS_ASSUME_NONNULL_BEGIN

@interface GJNotification : NSObject
@property (readonly, copy) GJNotificationName name;
@property (nullable, readonly, strong) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(GJNotificationName)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

+ (instancetype)notificationWithName:(GJNotificationName)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(GJNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

@end


/// 通知的原理机制请参考文章：1.https://juejin.cn/post/6844904082516213768#QlZ7o
/// 2.https://juejin.cn/post/6923141137733681165#heading-9
@interface GJNotificationCenter : NSObject

@property (class, readonly, strong) GJNotificationCenter *defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable GJNotificationName)aName object:(nullable id)anObject;

- (void)postNotification:(GJNotification *)notification;
- (void)postNotificationName:(GJNotificationName)aName object:(nullable id)anObject;
- (void)postNotificationName:(GJNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable GJNotificationName)aName object:(nullable id)anObject;

@end

NS_ASSUME_NONNULL_END
