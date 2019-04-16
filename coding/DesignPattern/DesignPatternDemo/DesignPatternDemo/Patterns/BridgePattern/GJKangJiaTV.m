//
//  GJKangJiaTV.m
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "GJKangJiaTV.h"

@implementation GJKangJiaTV
- (void)loadCommand:(NSString *)command {
    
    if ([command isEqualToString:@"up"]) {
        NSLog(@"%@---up",NSStringFromClass([self class]));
        
    } else if ([command isEqualToString:@"down"]) {
        NSLog(@"%@---down",NSStringFromClass([self class]));
        
    } else if ([command isEqualToString:@"left"]) {
        NSLog(@"%@---left",NSStringFromClass([self class]));
        
    } else if ([command isEqualToString:@"right"]) {
        NSLog(@"%@---right",NSStringFromClass([self class]));
    } else {
        NSLog(@"按错了😄");
    }
}

@end
