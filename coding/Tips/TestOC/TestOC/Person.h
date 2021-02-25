//
//  Person.h
//  TestOC
//
//  Created by admin on 2021/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCopying> {
    @public
    int _no;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

- (void)test;

- (void)personInstanceMethod;

+ (void)personClassMethod;

@end

NS_ASSUME_NONNULL_END
