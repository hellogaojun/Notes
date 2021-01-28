//
//  GJEventView.m
//  TipOne
//
//  Created by admin on 2021/1/27.
//

#import "GJEventView.h"
/**
 事件产生顺序：
 产生触摸事件—>UIApplication事件队列—>[UIWindow hitTest:withEvent:]—>返回更合适的View—>[子控件 hitTest:withEvent:]—>返回最合适的View
 
 事件传递给窗口或控件后，就调用hitTest:withEvent:方法寻找更合适的view。所以是，先传递事件，再根据事件在自己身上找更合适的view。不管子控件是不是最合适的view，系统默认都要先把事件传递给子控件，经过子控件调用子控件自己的hitTest:withEvent:方法验证后才知道有没有更合适的view。即便父控件是最合适的view了，子控件的hitTest:withEvent:方法还是会调用，不然怎么知道有没有更合适的！即，如果确定最终父控件是最合适的view，那么该父控件的子控件的hitTest:withEvent:方法也是会被调用的。
 
 响应者链的事件传递过程：
 1。如果当前view是控制器的view，那么控制器就是上一个响应者，事件就传递给控制器；如果当前view不是控制器的view，那么父视图就是当前view的上一个响应者，事件就传递给它的父视图
 2。在视图层次结构的最顶级视图，如果也不能处理收到的事件或消息，则其将事件或消息传递给window对象进行处理
 3。如果window对象也不处理，则其将事件或消息传递给UIApplication对象
 4。如果UIApplication也不能处理该事件或消息，则将其丢弃
 
 
 return nil的含义：
 hitTest：withEvent：中return nil的意思是调用当前hitTest：withEvent：方法的view不是合适的view，子控件也不是合适的view。如果同级的兄弟控件也没有合适的view，那么最合适的view就是父控件。
 
 事件的传递与响应：
 1、当一个事件发生后，事件会从父控件传给子控件，也就是说由UIApplication -> UIWindow -> UIView -> initial view,以上就是事件的传递，也就是寻找最合适的view的过程。

 2、接下来是事件的响应。首先看initial view能否处理这个事件，如果不能则会将事件传递给其上级视图（inital view的superView）；如果上级视图仍然无法处理则会继续往上传递；一直传递到视图控制器view controller，首先判断视图控制器的根视图view是否能处理此事件；如果不能则接着判断该视图控制器能否处理此事件，如果还是不能则继续向上传 递；（对于第二个图视图控制器本身还在另一个视图控制器中，则继续交给父视图控制器的根视图，如果根视图不能处理则交给父视图控制器处理）；一直到 window，如果window还是不能处理此事件则继续交给application处理，如果最后application还是不能处理此事件则将其丢弃

 3、在事件的响应中，如果某个控件实现了touches...方法，则这个事件将由该控件来接受，如果调用了[supertouches….];就会将事件顺着响应者链条往上传递，传递给上一个响应者；接着就会调用上一个响应者的touches….方法

 */
@implementation GJEventView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

//只要事件一传递给一个控件,这个控件就会调用他自己的hitTest：withEvent：方法
//寻找并返回最合适的View（能够响应事件的那个最合适的View）
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return nil;//self.subviews.firstObject;
}

@end

//假定是第一个addView (始终想让该View响应事件)，有两种方式：
//1.让SubOneView重写hitTest: withEvent: 返回self,同时让SubTwoView重写hitTest: withEvent: 返回nil
//2.让(SubOneView和SubTwoView)的父View重写hitTest: withEvent:返回其第一个子View(即SubOneView)
@implementation GJEventSubOneView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
//    return nil;
//}

@end

//假定是第二个addView
@implementation GJEventSubTwoView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
//    return nil;
//}


/**
 hitTest:withEvent: 底层实现
 
// 什么时候调用:只要事件一传递给一个控件，那么这个控件就会调用自己的这个方法
// 作用:寻找并返回最合适的view
// UIApplication -> [UIWindow hitTest:withEvent:]寻找最合适的view告诉系统
// point:当前手指触摸的点
// point:是方法调用者坐标系上的点
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    // 1.判断下窗口能否接收事件
     if (self.userInteractionEnabled == NO || self.hidden == YES ||  self.alpha <= 0.01) return nil;
    // 2.判断下点在不在窗口上
    // 不在窗口上
    if ([self pointInside:point withEvent:event] == NO) return nil;
    // 3.从后往前遍历子控件数组
    int count = (int)self.subviews.count;
    for (int i = count - 1; i >= 0; i--)     {
    // 获取子控件
    UIView *childView = self.subviews[i];
    // 坐标系的转换,把窗口上的点转换为子控件上的点
    // 把自己控件上的点转换成子控件上的点
    CGPoint childP = [self convertPoint:point toView:childView];
    UIView *fitView = [childView hitTest:childP withEvent:event];
    if (fitView) {
    // 如果能找到最合适的view
    return fitView;
    }
    }
    // 4.没有找到更合适的view，也就是没有比自己更合适的view
    return self;
}

*/

@end
