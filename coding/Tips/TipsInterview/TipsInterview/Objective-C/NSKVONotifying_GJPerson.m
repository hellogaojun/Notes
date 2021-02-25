//
//  NSKVONotifying_GJPerson.m
//  TipsInterview
//
//  Created by admin on 2021/2/25.
//

#import "NSKVONotifying_GJPerson.h"

@implementation NSKVONotifying_GJPerson
//setName:，class，dealloc，_isKVOA

- (void)setName:(NSString *)name {
    _NSSetObjectValueAndNotify();
    
    //会根据不同的类型生成具体的方法
//    _NSSetIntValueAndNotify();
//    _NSSetDoubleValueAndNotify();
//    _NSSetXXXValueAndNotify();
}

_NSSetObjectValueAndNotify() {
    willChangeValueForKey();
    setName();
    didChangeValueForKey();
}

//屏蔽内部实现
- (Class)class {
//    return [GJPerson class];
    return class_getSuperclass(object_getClass(self));
}

- (BOOL)_isKVOA {
    return YES;
}

- (void)dealloc {
    //收尾工作
}

@end
