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
    
    GJImageView *iv = [[GJImageView alloc]initWithFrame:CGRectMake(50, CGRectGetMaxY(redV.frame) + 100, 100, 100)];
    iv.image = [UIImage imageNamed:@"触摸事件分发原理"];
    [self.view addSubview:iv];
    
    GJButton *button = [GJButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(50, CGRectGetMaxY(iv.frame) + 100, 60, 60);
    button.layer.cornerRadius = 15;
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ViewController.view touch");
}

- (void)buttonClick {
    NSLog(@"buttonClick");
}

@end
