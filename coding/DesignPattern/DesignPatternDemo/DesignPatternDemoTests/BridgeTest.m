//
//  BridgeTest.m
//  DesignPatternDemoTests
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GJSubRemote.h"
#import "GJXiaoMiTV.h"
#import "GJKangJiaTV.h"

@interface BridgeTest : XCTestCase

@end

@implementation BridgeTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testAbstractClassCreation {
    GJAbstractRemote *remote = [GJAbstractRemote new];
    GJAbstractTV *tv = [GJAbstractTV new];
    remote.tv = tv;
    [tv loadCommand:@"up"];

}

- (void)testBridge {
   
    /**
     用抽象的遥控器对抽象电视机类进行引用,具体的实现由他们的子类来做
     桥接模式的特点:
     1. 将依赖具体的实现,改为依赖抽象. 得到松耦合的状态
     2. 分离了接口和实现部分
     3. 提高了扩展性.
     */
    
    GJSubRemote *remote = [GJSubRemote new];
    remote.tv = [GJXiaoMiTV new];
    [remote up];
    [remote right];
    
    remote.tv = [GJKangJiaTV new];
    [remote down];
    [remote left];
}


@end
