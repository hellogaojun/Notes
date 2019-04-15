//
//  ViewController.m
//  DebugQuickly
//
//  Created by gaojun on 2019/4/15.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    self.showLabel.text = @"123hehhehehhe";
    
    TestView *testV = [[TestView alloc]initWithFrame:CGRectMake(20, 100, 80, 80)];
    [self.view addSubview:testV];
}

//必须在injected方法中修改???
- (void)injected {
    NSLog(@"I've been injected: %@", self);

    //修改
    NSLog(@"开始修改了999");
    self.showLabel.text = @"必须要在injected方法中修改?";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)note {
    /**
     App通过注入动态库实现快速编译调试(热重载)
     
     1.下载并启动工具,Mac AppStore搜索:InjectionIII,下载安装到应用程序,使用该工具打开项目(Open Project)
     
     2.在AppDelegate中的application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中加入如下代码:
     OC版:
     #if DEBUG
     // Xcode10.2
     //    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
     
     //Xcode10.1
     [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection10.bundle"] load];
     #endif
     
     Swift版:
     
     3.在需要进行调试的代码类里,写上injected方法,injected方法里面即可以写上进行微调的代码,按下Command + S,即可进行调试,不需要重新启动App
     
     4.热重载原理,参考源码:
        * https://github.com/johnno1962/InjectionIII.git
        * https://mp.weixin.qq.com/s/hFnHdOP6pmIwzZck-zXE8g
     
     */
}

@end
