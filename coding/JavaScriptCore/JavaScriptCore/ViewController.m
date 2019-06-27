//
//  ViewController.m
//  JavaScriptCore
//
//  Created by gaojun on 2019/6/27.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSCoreExports <JSExport>

- (void)foo;

- (id)bar;

@end

@interface ViewController ()<TestJSCoreExports>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     Reference:
     https://ming1016.github.io/2018/04/21/deeply-analyse-javascriptcore/
     
     */
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testFour];
}


//1.通过JavaScriptCore在原生代码中调用JavaScript变量
- (void)testOne {
    //使用系统默认的JSVirtualMachine创建JS上下文对象
    JSContext *ctx = [[JSContext alloc]init];
    [ctx evaluateScript:@"var i = 4 + 8"];
    NSNumber *number = [ctx[@"i"] toNumber];
    NSLog(@"var i is %@,number is %@",ctx[@"i"],number);
}

//2.通过JavaScriptCore在原生代码中调用JavaScript函数对象
- (void)testTwo {
    JSVirtualMachine *jsvm = [[JSVirtualMachine alloc]init];
    JSContext *ctx = [[JSContext alloc]initWithVirtualMachine:jsvm];
    [ctx evaluateScript:@"function addition(x,y) {return x + y}"];
    JSValue *addition = ctx[@"addition"];
    JSValue *resultValue = [addition callWithArguments:@[@4,@8]];
    NSLog(@"function is %@;resultValue is %@",addition,[resultValue toNumber]);
}

//通过以上两个案例,可以知道，通过 evaluateScript 方法，就能够在原生代码中执行 JavaScript 脚本，并 使用 JavaScript 的值对象和函数对象//


//3.Block方式:通过JavaScriptCore让JavaScript调用原生代码
- (void)testThree {
    JSContext *ctx = [[JSContext alloc]init];
    ctx[@"subtraction"] = ^(int x, int y) {
        return x - y;
    };
    
    JSValue *subValue = [ctx evaluateScript:@"subtraction(4,8)"];
    NSLog(@"subtraction(4,8) is %@",[subValue toNumber]);
    
}

//4.JSExport方式:通过JavaScriptCore让JavaScript调用原生代码
- (void)testFour {
    JSContext *ctx = [[JSContext alloc]init];
    ctx[@"bar"] = [self bar];
//    ctx[@"foo"] = (__bridge_transfer void)[self foo]);
    
    JSValue *resultValue1 = [ctx evaluateScript:@"bar"];
    JSValue *resultValue2 = [ctx evaluateScript:@"foo"];
    NSLog(@"resultValue1 is %@;resultValue2 is %@",[resultValue1 toString],resultValue2);
}

#pragma mark - TestJSCoreExports

- (void)foo {
    NSLog(@"foo");
}

- (id)bar {
    return @"bar";
}


@end
