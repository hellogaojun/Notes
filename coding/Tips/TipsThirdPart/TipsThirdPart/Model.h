//
//  Model.h
//  TipsThirdPart
//
//  Created by admin on 2021/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@end

@interface YYAuthor : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSDate *birthday;
@end

@interface YYBook : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger pages;
@property (nonatomic, strong) YYAuthor *author;
@end

NS_ASSUME_NONNULL_END
