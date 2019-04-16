//
//  Test_DemoTests.m
//  Test-DemoTests
//
//  Created by gaojun on 2019/3/13.
//  Copyright © 2019年 gaojun. All rights reserved.
//


#import <XCTest/XCTest.h>

#import "GJModel.h"

@interface Test_DemoTests : XCTestCase

@end

@implementation Test_DemoTests

/**Reference:
1.http://baiduhidevios.github.io/2016/03/20/iOS单元测试/
2.https://xiaozhuanlan.com/topic/3790216845
3.https://developer.apple.com/videos/play/wwdc2016/409/
4.https://developer.apple.com/videos/play/wwdc2017/414/
5.https://developer.apple.com/videos/play/wwdc2015/406/
6.https://developer.apple.com/videos/play/wwdc2018/403/
7.https://developer.apple.com/videos/play/wwdc2018/417
 
 ***新建项目时默认是勾选单元测试和UI测试的;如果新建项目时没有勾选,也可以通过File-New-Target进行创建!*
 
 ***测试基本原理:
 Unit Test:
 单元测试会编译进一个测试 bundle。运行时，Xcode 启动一个 app 的实例作为测试的运行器。运行器加载测试包并且执行其中所有的测试，这就是单元测试的实现了.
 
 UI Test:
 UI 测试也类似，同样编译进一个包，不同的是测试包是被一个 Xcode 创建的自定义 app 加载的，你的 app 不再直接执行测试，而是自动操作你的 app ，和不同的 UI 组件进行交互.
 
 ***为什么要进行单元测试,进行单元测试有什么好处???
 
*/

- (void)_writeUnitTestNote {
    //Who(谁来写)
    //1.最好是开发者本人
    
    //How(怎么写) 编写分为三个步骤:
    //1.Mock对象,准备测试数据
    //2.调用要测试的目标API
    //3.验证输出和行为是否正确
    
    /**
     代码的可测性:
     1.类之间要松耦合
     2.被测试的函数需要产生可测的结果
     3.被测试的函数需要遵循单一职责
     4.展示和业务代码要分开
     */
    
    
    //具体项目中,该怎么测试呢???测试的Tips & Tricks
    //通知的测试该如何进行???
    //1.分解代码使代码可测试
    //2.用 URLProtocol 作为 Mock 工具
    
    
    
    
    /**
     最佳实践:
     1.每个功能类都应提供单元测试，且每一个测试类，只依赖于其要测试的受测类。使用伪造对象避免对其他类的依赖，保证一个测试类只关注一个被测类，当测试不通过时，就能迅速的定位到是谁发生了错误，而不会受到其他类的干扰；使用伪造环境避免其他环境的干扰，保证case在任何环境下都能输出同样的测试结果
     
     2.一个单测方法只测试一个功能点，并且不依赖其他测试用例的结果作为输入，保证case的原子性。if-else这种分支的情况最好分成两个case来测试
     
     3.单元测试通过数据的变化来做输出结果的验证
     
     4.应对所有暴露的属性和方法提供测试（包含回调方法），私有方法则不必。因为对外接口应该会调用到所有的私有方法，而且私有方法相对公有方法来说发生变动的可能性大很多，会造成不必要的修改测试代码的成本。如果非要测试私有方法，可以通过KVC、子类化和类别来实现
     
     5.TDD，测试驱动开发的妙处即在于，它以需求为引领，通过测试的形式，来指导开发者进行软件的设计与架构，并编写出最为精炼的代码，使得测试用例运行通过。经过适当的重构之后，测试用例与产品代码可达到较为健康的状态。
     */
    
    
    //衡量标准
    //1.代码覆盖率
    //2.Case的成功率
    
}

//Setup是在所有测试用例运行之前运行的函数，在这个测试用例里进行一些通用的初始化工作
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"%s",__func__);
}

//tearDown是在所有的测试用例都执行完毕后执行的
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
     NSLog(@"%s",__func__);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    //性能测试,主要就是评估一段代码的运行时间
    //每一个测试用例会执行10次
    //TODO:需要给性能测试一个参考时间!!!
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (NSInteger index = 0; index < 10000; index ++) {
            NSLog(@"%ld",index);
        }
    }];
}

- (void)testModelFunc_randomLessThanTen {
    NSLog(@"%s",__func__);
    GJModel *model = [GJModel new];
    NSInteger num = [model randomLessThanTen];
    XCTAssert(num < 10,@"the function has a bug");
}

//通过断言来判决本次结果的正确性(不存在模棱两可!!!)
- (void)testModelFunc_isValidAmount {
    GJModel *model = [GJModel new];

    NSArray *desArr = @[@"1000.25",@"1000",@"100.2536",@"1000.36.89",@".14",@"12a.b4",@"d",@"中国",@"！@#￥%%………………&*（）",@"..",@"...",@"1234."];
    
    for (NSString *str in desArr) {
        NSInteger num = [model isValidAmountStr2:str];
        NSLog(@"str:%@",str);
//        XCTAssert(!num,@"the function has a correct format");
        XCTAssertFalse(num,@"the function is normal");
    }
    
}

- (void)testAsyncFunction {
    //异步测试的逻辑如下，首先定义一个或者多个XCTestExpectation，表示异步测试想要的结果。
    //然后设置timeout，表示异步测试最多可以执行的时间。
    //最后，在异步的代码完成的最后，调用fullfill来通知异步测试满足条件。
    XCTestExpectation *expectation = [self expectationWithDescription:@"Just a demo expectation should pass"];
//    expectation = [self expectationForPredicate:<#(nonnull NSPredicate *)#> evaluatedWithObject:<#(nonnull id)#> handler:<#^BOOL(void)handler#>];
    
//    expectation = [self expectationForNotification:<#(nonnull NSNotificationName)#> object:<#(nullable id)#> handler:<#^BOOL(NSNotification * _Nonnull notification)handler#>];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(3);
        NSLog(@"Async test");
        XCTAssert(YES,@"should pass");
        //调用fulfill触发(2)处的代码
        [expectation fulfill];
    });
    
    //(2). 此处代码可以由fulfill触发,或者因超时而被触发!!!
    [self waitForExpectationsWithTimeout:4 handler:^(NSError * _Nullable error) {
        //Do something when time out
        NSLog(@"error:%@",error);
    }];
    
//    self waitForExpectations:<#(nonnull NSArray<XCTestExpectation *> *)#> timeout:<#(NSTimeInterval)#>
    
//    self waitForExpectations:<#(nonnull NSArray<XCTestExpectation *> *)#> timeout:<#(NSTimeInterval)#> enforceOrder:<#(BOOL)#>
}

//测试覆盖率
- (void)testCoverage {
    //在Edit Scheme中选中Test,然后在Options中的Code Coverage选中需要覆盖的target!
}

//测试的几大块:测试网络,测试通知,测试协议
//如何进行UI测试????


//测试选项和顺序
//默认情况下,测试顺序是按名字排序的!!!
//1.可以开启随机测试模式:Randomize execution order
//2.
- (void)testA {
    NSLog(@"%s",__func__);
}

- (void)testB {
    NSLog(@"%s",__func__);
}

- (void)testC {
    NSLog(@"%s",__func__);
}

- (void)testD {
    NSLog(@"%s",__func__);
}

@end
