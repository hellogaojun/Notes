//
//  Test.m
//  TestOC
//
//  Created by admin on 2021/3/31.
//

#import "Test.h"

@interface Test (){
//    NSString *_name;
}

@end

@implementation Test
@synthesize name = _name;
//@dynamic name;

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

@end
