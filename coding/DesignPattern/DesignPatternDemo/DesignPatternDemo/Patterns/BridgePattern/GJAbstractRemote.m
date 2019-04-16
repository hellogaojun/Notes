//
//  GJAbstractRemote.m
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "GJAbstractRemote.h"

@implementation GJAbstractRemote

- (instancetype)init {
    NSAssert(![self isMemberOfClass:[GJAbstractRemote class]], @"GJAbstractRemote is an abstract class, you should not instantiate it directly.");
    
    return [super init];
}

- (void)setCommand:(NSString *)command {
    [self.tv loadCommand:command];
}

- (void)up {}
- (void)down {}
- (void)left {}
- (void)right {}

@end
