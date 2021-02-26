//
//  Animal+one.m
//  TipsInterview
//
//  Created by admin on 2021/2/25.
//

#import "Animal+one.h"

@implementation Animal (one)

+ (void)initialize {
    NSLog(@"Animal (one) initialize");
}

+ (void)load {
    NSLog(@"Animal (one) load");
}

- (void)run {
    NSLog(@"Animal (one) === run");
}

@end
