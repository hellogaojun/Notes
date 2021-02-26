//
//  Animal.m
//  TipsInterview
//
//  Created by admin on 2021/2/25.
//

#import "Animal.h"

@implementation Animal

+ (void)initialize {
    NSLog(@"Animal initialize");
}

+ (void)load {
    NSLog(@"Animal load");
}

- (void)run {
    NSLog(@"Animal === run");
}


@end
