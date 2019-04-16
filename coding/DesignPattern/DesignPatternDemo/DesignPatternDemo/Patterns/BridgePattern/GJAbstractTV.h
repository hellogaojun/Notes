//
//  GJAbstractTV.h
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
///电视机抽象基类
@interface GJAbstractTV : NSObject

//电视机对外提供的接口
- (void)loadCommand:(NSString *)command;

@end

NS_ASSUME_NONNULL_END
