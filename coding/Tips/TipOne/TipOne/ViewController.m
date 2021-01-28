//
//  ViewController.m
//  TipOne
//
//  Created by admin on 2021/1/27.
//

#import "ViewController.h"
#import "GJEventView.h"
#import "GJEventTestView.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    GJEventView *v = [[GJEventView alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];;
//    v.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:v];
    
//    GJEventSubOneView *redView = [[GJEventSubOneView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
//    redView.backgroundColor = [UIColor redColor];
//    [v addSubview:redView];

//    GJEventSubTwoView *greenView = [[GJEventSubTwoView alloc]initWithFrame:CGRectMake(150, CGRectGetMaxY(redView.frame) + 50, 100, 100)];
//    greenView.backgroundColor = [UIColor greenColor];
//    [v addSubview:greenView];
    
    
    GJRedView *redV = [[GJRedView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:redV];
    GJGreenView *greenV = [[GJGreenView alloc]initWithFrame:CGRectMake(-20, -50, 150, 150)];
    [redV addSubview:greenV];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ViewController.view touch");
}


@end
