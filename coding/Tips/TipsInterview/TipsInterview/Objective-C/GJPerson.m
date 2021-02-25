//
//  GJPerson.m
//  TipsInterview
//
//  Created by admin on 2021/2/24.
//

#import "GJPerson.h"

@implementation GJPerson


- (void)setName:(NSString *)name {
    _name = name;
    NSLog(@"%s",__func__);
}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"willChangeValueForKey===begin");
    
    [super willChangeValueForKey:key];
    
    NSLog(@"willChangeValueForKey===end");
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey===begin");
    
    [super didChangeValueForKey:key];
    
    NSLog(@"didChangeValueForKey===end");
}

@end
