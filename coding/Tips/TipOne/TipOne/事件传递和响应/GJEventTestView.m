//
//  GJEventTestView.m
//  TipOne
//
//  Created by admin on 2021/1/28.
//

#import "GJEventTestView.h"

@implementation GJEventTestView

@end

@implementation GJGreenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        //点击事件
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(greenTap:)];
//        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"GreenView Touch");
    
//    [super touchesBegan:touches withEvent:event];
}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    return self.superview;
//}

- (void)greenTap:(UITapGestureRecognizer *)tap {
    NSLog(@"GreenView Tap");
}

@end

@implementation GJRedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"RedView Touch");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    //把被点击的点转换成子控件坐标系上的点
    CGPoint greenViewPoint = [self convertPoint:point toView:self.subviews.firstObject];

    //触摸点在自己身上或者触摸点在子控件身上都返回自己作为最合适的View
//    if ([self pointInside:point withEvent:event] ||
//        [self.subviews.firstObject pointInside:greenViewPoint withEvent:event]) {
//        return self;
//    }

    //触摸点在子控件身上，就返回子控件作为最合适的View
    if ([self.subviews.firstObject pointInside:greenViewPoint withEvent:event]) {
        return self.subviews.firstObject;
    }

    return [super hitTest:point withEvent:event];
}


/**
 Q1:当子控件和父控件重叠时，点击子控件，子控件响应事件。也就是说，点击绿色的view和红色的view的重叠部分，只有绿色的view响应事件
 
 A1:默认就是绿色的view响应事件，但是仅限于重叠部分，点击绿色view上的非重叠部分，绿色和红色view都不会响应。
 原因在于，系统从window向下寻找最合适的view时候，遍历到红色的view时候，发现点不在红色的view上，那么默认控制器的view就是最合适的view。即控制器的view响应了事件。即代码层面无需处理
 
 
 
 Q2:当子控件和父控件部分重叠时，点击父子控件重叠部分，只有父控件响应事件。也就是说，点击绿色的view和红色的view的重叠部分，只有红色的view响应事件。
 
 A2:点击子控件，却要让父控件响应事件，说明子控件本身不是最合适的view，父控件才是最合适的view，因为hitTest:withEvent:方法的作用就是控件接收到事件后，判断自己是否能处理事件，判断点在不在自己的坐标系上，然后返回最合适的view。所以，我们可以在hitTest:withEvent:方法里面强制返回父控件为最合适的view，也就是返回红色的view。
 注意，不能够重写父控件的hitTest:withEvent:方法，也就是不能够重写红色的view的hitTest:withEvent:方法。原因在于，如果重写父控件的hitTest:withEvent:方法，并在该方法中返回父控件本身，会导致点击父控件的父控件时，也是父控件为最合适的view。反应在上面的例子上就是，点击白色的地方，也是红色的view响应事件。即代码如下：
 在绿色View中：
 - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     return self.superview;
 }

 
 Q3:无论点击什么地方，父控件响应事件。也就是说，点击白色的view、红色的view或者绿色的view上的任一点（屏幕上任一点），都只是红色的view响应事件。
 
 A3:点击屏幕上任意点，都是红色的view响应事件，根据视图层次结构，我们只需要重写红色View的hit:test:方法，并在此方法中返回红色的view即可。即代码如下：
 在红色View中：
 - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     return self;
 }
 
 
 Q4:当子控件和父控件部分重叠时，点击非重叠部分，父控件响应事件。也就是说，点击绿色的view的上半部分（即不重叠的部分），红色的view响应事件。
 
 A4: 方案如下：
 在红色View中重写hitTest:withEvent:方法
 - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     //把被点击的点转换成子控件坐标系上的点
     CGPoint greenViewPoint = [self convertPoint:point toView:self.subviews.firstObject];
     //触摸点在自己身上或者触摸点在子控件身上都返回自己作为最合适的View
     if ([self pointInside:point withEvent:event] ||
         [self.subviews.firstObject pointInside:greenViewPoint withEvent:event]) {
         return self;
     }
     return [super hitTest:point withEvent:event];
 }
 
 
 
 Q5:当子控件和父控件部分重叠时，点击子控件，父控件和子控件都响应事件。也就是说，点击绿色的view，不但绿色的view本身响应事件，红色的view也响应事件。
 
 A5:事件的响应是顺着响应者链条向上传递的，即从子控件传递给父控件，touch方法默认不处理事件，而是把事件顺着响应者链条传递给上一个响应者。这样我们就可以依托这个原理，让一个事件多个控件响应。在绿色View做如下处理：
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"GreenView Touch");
     
     [super touchesBegan:touches withEvent:event];
 }
 
 */
@end

@implementation GJImageView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return self.superview.subviews.firstObject;
}

@end

@implementation GJButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return self.superview;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"button click");
//    [super touchesBegan:touches withEvent:event];
}

@end
