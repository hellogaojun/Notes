//
//  ViewController.m
//  TipsInterview
//
//  Created by admin on 2021/2/22.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Objective-C/GJPerson.h"
#import "Objective-C/Animal+one.h"
#import "Objective-C/Dog.h"
#import "Objective-C/Student.h"
#import "RunloopController.h"

@interface ViewController ()

@property (nonatomic, strong) GJPerson *person1;
@property (nonatomic, strong) GJPerson *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //看print的打印结果，试分析之（神奇的代码）
//    id cls = [GJPerson class];
//    void *obj = &cls;
//    [(__bridge id)obj print];// my name's <ViewController: 0x7ff6dc404cb0>

    [NSRunLoop mainRunLoop];
    [NSRunLoop currentRunLoop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RunloopController *vc = [sb instantiateViewControllerWithIdentifier:@"runloop"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)testInitializeAndLoad {
    Dog *d = [Dog new];
    
    Animal *a = [Animal new];
    [a run];
    
    Dog *d2 = [Dog new];
}

#pragma mark - KVO

- (void)addKVO {
    self.person1 = [[GJPerson alloc] init];
    self.person1.name = @"1";
  
    self.person2 = [[GJPerson alloc] init];
    self.person2.name = @"2";
    
//    [self printMethodNamesOfClass:object_getClass(self.person1)];//GJPerson name，.cxx_destruct，setName:,
    
    NSLog(@"添加KVO之前：%p ---- %p",[self.person1 methodForSelector:@selector(setName:)],[self.person2 methodForSelector:@selector(setName:)]);//0x1044f9070 ---- 0x1044f9070
    
    
    //给Person对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    //addObserver之后，person1的isa指向由GJPerson变成了NSKVONotifying_GJPerson
    [self.person1 addObserver:self forKeyPath:@"name" options:options context:@"123"];
    
    NSLog(@"==========================================");
    
    //分别打印类里面的方法
//    [self printMethodNamesOfClass:object_getClass(self.person1)];//NSKVONotifying_GJPerson setName:，class，dealloc，_isKVOA，
//    [self printMethodNamesOfClass:object_getClass(self.person2)];//GJPerson name，.cxx_destruct，setName:，
    
    NSLog(@"添加KVO之后：%p ---- %p",[self.person1 methodForSelector:@selector(setName:)],[self.person2 methodForSelector:@selector(setName:)]);//0x7fff207b5b57 ---- 0x1044f9070
    
    //在lldb调试模式下，可以通过下面的方式看到IMP指针对应的方法：
    /*
     
     (lldb) p (IMP)0x1044f9070
    (IMP) $0 = 0x00000001044f9070 (TipsInterview`-[GJPerson setName:] at GJPerson.m:13)
    (lldb) p (IMP)0x7fff207b5b57
    (IMP) $1 = 0x00007fff207b5b57 (Foundation`_NSSetObjectValueAndNotify)
     
     */
}

- (void)setProperty {
    //addObserver之后，settter方法自动触发KVO
    self.person1.name = @"20";
    
    self.person2.name = @"20";
}

//手动触发KVO
- (void)mannualTriggerKVO {
    self.person1 = [[GJPerson alloc] init];
    self.person1.name = @"1";

    //给Person对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    //addObserver之后，person1的isa指向由GJPerson变成了NSKVONotifying_GJPerson
    [self.person1 addObserver:self forKeyPath:@"name" options:options context:@"123"];
    

    //手动触发KVO
    [self.person1 willChangeValueForKey:@"name"];
    [self.person1 didChangeValueForKey:@"name"];
}

//当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change,context);
}

- (void)printMethodNamesOfClass:(Class)class {
    unsigned int count;
    //获取方法数组
    Method *methodList = class_copyMethodList(class, &count);
    
    NSMutableString *methodNames = [NSMutableString string];
    //遍历所有方法
    for (int i = 0; i < count; i ++) {
        //获得方法
        Method method= methodList[i];
        //获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        //拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@"，"];
    }
    //释放
    free(methodList);
    //打印方法名
    NSLog(@"%@ %@", class, methodNames);
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}



@end
