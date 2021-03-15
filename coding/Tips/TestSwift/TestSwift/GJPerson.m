//
//  GJPerson.m
//  TestSwift
//
//  Created by admin on 2021/3/15.
//

#import "GJPerson.h"

@implementation GJPerson

- (instancetype)initWithName:(NSString *)name age:(int)age {
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (void)eat {
    NSLog(@"%@---eat",self.name);
}

- (void)run {
    NSLog(@"%@---run",self.name);
}

@end
