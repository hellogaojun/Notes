//
//  Person.m
//  TestOC
//
//  Created by admin on 2021/2/22.
//

#import "Person.h"

@implementation Person

- (void)test {
    NSLog(@"Person-test");
}

+ (void)personClassMethod {}

- (void)personInstanceMethod {}

- (id)copyWithZone:(nullable NSZone *)zone {return nil;}

- (void)dealloc {
    NSLog(@"Person dealloc");
}

@end
