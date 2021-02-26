//
//  Animal+two.m
//  TipsInterview
//
//  Created by admin on 2021/2/25.
//

#import "Animal+two.h"

@implementation Animal (two)

+ (void)initialize {
    NSLog(@"Animal (two) initialize");
}

+ (void)load {
    NSLog(@"Animal (two) load");
}

- (void)run {
    NSLog(@"Animal (two) === run");
}

@end
