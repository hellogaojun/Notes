//
//  Dog.m
//  TipsInterview
//
//  Created by admin on 2021/2/26.
//

#import "Dog.h"

@implementation Dog

//如果子类没有实现+initialize，会调用父类的+initialize（所以父类的+initialize可能会被调用多次）

//+ (void)initialize {
//    NSLog(@"Dog initialize");
//}

+ (void)load {
    NSLog(@"Dog load");
}

@end
