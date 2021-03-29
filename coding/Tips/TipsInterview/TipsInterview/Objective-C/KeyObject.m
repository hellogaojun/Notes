//
//  KeyObject.m
//  TipsInterview
//
//  Created by admin on 2021/3/29.
//

#import "KeyObject.h"

@interface KeyObject (){
    NSUInteger _hashValue;
}

@end


@implementation KeyObject

- (instancetype)initWithHashI:(NSUInteger)i {
    if (self = [super init]) {
        _hashValue = i;
    }
    
    return self;
}

#pragma mark - overload method

- (BOOL)isEqual:(id)object {
    //根据hash值判断是否是同一个键值
    return ([self hashKeyValue] == [(typeof(self))object hashKeyValue]);
}

- (NSUInteger)hash {
    //返回hash值
    return [self hashKeyValue];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    KeyObject *obj = [KeyObject allocWithZone:zone];
    obj->_hashValue = _hashValue;
    return obj;
}

#pragma mark - private method

- (NSUInteger)hashKeyValue {
    return _hashValue % 3;
}


@end
