//
//  GJNotificationCenter.m
//  TipOne
//
//  Created by admin on 2021/1/29.
//

#import "GJNotificationCenter.h"

@interface GJNotification ()

@property (nonatomic, copy) GJNotificationName name;
@property (nonatomic, nullable,strong) id object;
@property (nonatomic, nullable,copy) NSDictionary *userInfo;

@property (nonatomic,weak) id observer;
@property (nonatomic,assign) SEL selector;

@end

@implementation GJNotification

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithName:(GJNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo {
    if (self = [super init]) {
        self.name = name;
        self.object = object;
        self.userInfo = userInfo;
    }
    return self;
}

+ (instancetype)notificationWithName:(GJNotificationName)aName object:(id)anObject {
    return [self notificationWithName:aName object:anObject userInfo:nil];
}

+ (instancetype)notificationWithName:(GJNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    return [[GJNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
}

- (NSString *)name {
    return _name;
}

- (id)object {
    return _object;
}

- (NSDictionary *)userInfo {
    return _userInfo;
}

@end

@interface GJNotificationCenter ()

@property (nonatomic, strong) NSMutableArray *notificationPools;

@end

@implementation GJNotificationCenter

+ (GJNotificationCenter *)defaultCenter {
    static GJNotificationCenter * _instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[GJNotificationCenter alloc]init];
    });
    return _instance;
}

- (instancetype)init {
    if(self = [super init]) {
        _notificationPools = [NSMutableArray array];
    }
    return self;
}

//注册通知的过程就是存储的过程
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(GJNotificationName)aName object:(id)anObject {
    GJNotification *note = [[GJNotification alloc]init];
    note.observer = observer;
    note.selector = aSelector;
    note.object = anObject;
    note.name = aName;
    note.selector = aSelector;
    [self.notificationPools addObject:note];
    
    //逻辑应该这样写：
    if (aName) {//name存在
        
    } else if (anObject) {//name为空，但object不为空
        
    } else {//name 和 object都为空
        
    }
}

- (void)removeObserver:(id)observer {
    [self removeObserver:observer name:nil object:nil];
}

- (void)removeObserver:(id)observer name:(GJNotificationName)aName object:(id)anObject {
    
}

//发送通知就是找到所有的注册者，遍历调用[observer performSelector:selector withObject:obj]
- (void)postNotification:(GJNotification *)notification {
    //object send the note
    [self.notificationPools enumerateObjectsUsingBlock:^(GJNotification *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.name isEqualToString:notification.name]) {//name is the unique flag
            if ([obj.observer respondsToSelector:obj.selector]) {
                [obj.observer performSelector:obj.selector withObject:obj];
            }
        }
    }];
}

- (void)postNotificationName:(GJNotificationName)aName object:(id)anObject {
    [self postNotificationName:aName object:anObject userInfo:nil];
}

- (void)postNotificationName:(GJNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    //此处创建不当！！！
    GJNotification *note = [GJNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotification:note];
}

@end
