//
//  Student.h
//  TestOC
//
//  Created by admin on 2021/2/22.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person <NSCoding>

@property (nonatomic, assign) int score;
@property (nonatomic, assign) int grade;

- (void)studentInstanceMethod;
+ (void)studentClassMethod;

@end

NS_ASSUME_NONNULL_END
