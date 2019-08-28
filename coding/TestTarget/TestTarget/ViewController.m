//
//  ViewController.m
//  TestTarget
//
//  Created by gaojun on 2017/8/26.
//  Copyright © 2017 gaojun. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <BlocksKit.h>
#import <UIView+BlocksKit.h>
#import <YYModel.h>
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (TARGETTYPE == 1) {
        //只能在release下使用Person
        Person *p = [Person new];
    }
}


@end
