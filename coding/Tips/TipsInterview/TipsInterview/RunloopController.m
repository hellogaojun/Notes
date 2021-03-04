//
//  RunloopController.m
//  TipsInterview
//
//  Created by admin on 2021/3/3.
//

#import "RunloopController.h"
#import "Objective-C/GJThread.h"

@interface RunloopController ()

@property (nonatomic, strong) GJThread *thread;
@property (nonatomic, assign,getter=isStoped) BOOL stoped;
@end

@implementation RunloopController

void callout(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");
            break;
        default:
            break;
    }
}

void addObserver() {
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0,  callout, NULL);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
    NSLog(@"%@",CFRunLoopGetCurrent());

    //执行Blocks
    CFRunLoopPerformBlock(CFRunLoopGetCurrent(), kCFRunLoopCommonModes, ^{
        NSLog(@"~~~~~");
    });
}

//解决NSTimer在滑动时停止工作的问题（mode的切换）
void timer() {
    static int count = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"count:%d === mode:%@",count,CFRunLoopGetCurrent());
    }];
    //The receiver retains aTimer
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

//线程保活
void threadSave() {
    GJThread *thread = [[GJThread alloc]initWithBlock:^{
        NSLog(@"run");
        
        [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    }];
    [thread start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor orangeColor];
    
    self.stoped = NO;
    
    __weak typeof(self) weakSelf = self;

    self.thread = [[GJThread alloc]initWithBlock:^{
        NSLog(@"run begin ------- %@",[NSThread currentThread]);

        //往runloop中添加source/timer/observer
        [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];

        while (weakSelf && !weakSelf.isStoped) {
            //this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers.
//            [[NSRunLoop currentRunLoop] run];
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }


        NSLog(@"run end ------- %@",[NSThread currentThread]);
    }];
    [self.thread start];

}

- (void)test {
    NSLog(@"excute task ----- %@",[NSThread currentThread]);
}


- (IBAction)stopThread:(id)sender {
    
    //waitUntilDone设置为YES代表self.thread 执行完毕后，这个方法才会往下执行
    [self performSelector:@selector(stop) onThread:self.thread withObject:nil waitUntilDone:YES];
    
}

- (void)stop {
    self.stoped = YES;
    
    //停止runloop
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    NSLog(@"stop ------- %@",[NSThread currentThread]);
    
    self.thread = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //打断点：在lldb调试模式下，输入bt，打印函数调用栈
//    NSLog(@"%s",__func__);
    
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}


- (void)dealloc {
    NSLog(@"%s",__func__);
    
    [self stopThread:nil];

    
}

@end
