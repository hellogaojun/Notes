//
//  GJAbstractRemote.h
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GJRemoteProtocol.h"

#import "GJAbstractTV.h"

NS_ASSUME_NONNULL_BEGIN
///遥控器抽象基类
@interface GJAbstractRemote : NSObject<GJRemoteProtocol>

@property (nonatomic, strong) GJAbstractTV *tv;

- (void)setCommand:(NSString *)command;

@end

NS_ASSUME_NONNULL_END
