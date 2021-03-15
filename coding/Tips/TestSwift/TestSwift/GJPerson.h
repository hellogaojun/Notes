//
//  GJPerson.h
//  TestSwift
//
//  Created by admin on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJPerson : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;


- (instancetype)initWithName:(NSString *)name age:(int)age;

- (void)eat;

- (void)run;

@end

NS_ASSUME_NONNULL_END
