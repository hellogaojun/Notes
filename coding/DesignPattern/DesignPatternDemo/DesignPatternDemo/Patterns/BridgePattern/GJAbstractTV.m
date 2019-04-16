//
//  GJAbstractTV.m
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "GJAbstractTV.h"

@implementation GJAbstractTV

- (instancetype)init {
    NSAssert(![self isMemberOfClass:[GJAbstractTV class]], @"GJAbstractTV is an abstract class, you should not instantiate it directly.");
    
    return [super init];
}

- (void)loadCommand:(NSString *)command {
    [[NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] userInfo:nil] raise];
}

@end
