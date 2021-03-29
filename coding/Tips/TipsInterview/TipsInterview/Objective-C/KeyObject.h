//
//  KeyObject.h
//  TipsInterview
//
//  Created by admin on 2021/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyObject : NSObject<NSCopying>

- (instancetype)initWithHashI:(NSUInteger)i;

@end

NS_ASSUME_NONNULL_END
