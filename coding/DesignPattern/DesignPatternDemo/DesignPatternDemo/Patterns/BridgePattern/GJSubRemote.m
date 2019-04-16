//
//  GJSubRemote.m
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "GJSubRemote.h"

@implementation GJSubRemote
- (void)up {
    [self setCommand:@"up"];
}

- (void)down {
    [self setCommand:@"down"];
}

- (void)left {
    [self setCommand:@"left"];
}

- (void)right {
    [self setCommand:@"right"];
}

@end
