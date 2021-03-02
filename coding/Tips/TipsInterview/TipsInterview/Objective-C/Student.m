//
//  Student.m
//  TipsInterview
//
//  Created by admin on 2021/3/2.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[self class]:%@",[self class]);//[self class]:Student
        NSLog(@"[super class]:%@",[super class]);//[super class]:Student
        NSLog(@"[self superclass]:%@",[self superclass]);//[self superclass]:Person
        NSLog(@"[super superclass]:%@",[super superclass]);//[super superclass]:Person
    }
    return self;
}
@end
