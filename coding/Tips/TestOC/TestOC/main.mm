//
//  main.m
//  TestOC
//
//  Created by admin on 2021/2/22.
//
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "MJClassInfo.h"
#import "Test.h"

//NSObject对应的C++代码
struct NSObject_IMPL {
    Class isa;
};

//Person对应的C++代码
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
    NSString * _Nonnull _name;
};

//Student对应C++代码
struct Student_IMPL {
    struct Person_IMPL Person_IVARS;
    int _score;
    int _grade;
};

void test1() {
    NSObject *obj = [[NSObject alloc]init];
    
    Person *p = [[Person alloc]init];
    p.age = 66;
    p.name = @"Jobs";
    
    p->_no = 9;
    
    struct Person_IMPL *p2 = (__bridge struct Person_IMPL *)(p);
    NSLog(@"no:%d,age:%d,name:%@",p2->_no,p2->_age,p2->_name);
    
    Student *stu2 = [Student new];
    struct Student_IMPL *stu = (__bridge struct Student_IMPL *)(stu2);
    stu->_grade = 3;
    stu->_score = 100;
    NSLog(@"Student:: score:%d,grade:%d",stu2.score,stu2.grade);
    
//        size_t size_p = class_getInstanceSize(Person.class);
//        size_t size_p2 = malloc_size((__bridge const void *)(p));
//    int size_p3 = sizeof(struct Person_IMPL);//24
}

void test2() {
    NSObject *obj1 = [[NSObject alloc]init];
    NSObject *obj2 = [[NSObject alloc]init];
    Class objectClass1 = [obj1 class];
    Class objectClass2 = [obj2 class];
    Class objectClass3 = [NSObject class];
    Class objectClass4 = object_getClass(obj1);
    Class objectClass5 = object_getClass(obj2);
    Class objectClass6 = [objectClass1 class];//获取的仍然是类对象
    
    Class objectMetaClass = object_getClass(objectClass1);
    
    //判断类对象是否为元类对象
    BOOL result = class_isMetaClass(objectClass6);
    BOOL result2 = class_isMetaClass(objectMetaClass);
    
}

void test3() {
    Student *stu = [Student new];
    stu.score = 100;
    
    mj_objc_class *studentClass = (__bridge struct mj_objc_class *)([Student class]);
    mj_objc_class *personClass = (__bridge struct mj_objc_class *)([Person class]);
    
    class_rw_t *studentClassData = studentClass->data();
    class_rw_t *personClassData = personClass->data();
    
    class_rw_t *studentMetaClassData = studentClass->metaClass()->data();
    class_rw_t *personMetaClassData = personClass->metaClass()->data();
    
    NSLog(@"end");
}

//ARC 环境

//访问了auto变量：__NSMallocBlock，在MRC环境下是__NSStackBlock
void blockTest1() {
    int age = 10;
    static int height = 30;
    void (^block)(int,int) = ^(int a,int b) {
        NSLog(@"this is a block age:%d, height:%d",age,height);
        NSLog(@"this is a block");
    };
    
    age = 100;
    height = 300;
    
    block(20,20);
    
    NSLog(@"%@",[block class]);//__NSMallocBlock__
    NSLog(@"%@",[[block class] superclass]);//__NSMallocBlock
    NSLog(@"%@",[[[block class] superclass] superclass]);//NSBlock
    NSLog(@"%@",[[[[block class] superclass] superclass] superclass]);//NSObject
    NSLog(@"%@",[[[[[block class] superclass] superclass] superclass] superclass]);//(null)
}

//没有访问auto变量：__NSGlobalBlock
void blockTest2() {
    void (^block)(int,int) = ^(int a,int b) {
        NSLog(@"this is a block");
    };
    
    NSLog(@"%@",[block class]);// __NSGlobalBlock__
    NSLog(@"%@",[[block class] superclass]);//__NSGlobalBlock
    NSLog(@"%@",[[[block class] superclass] superclass]);//NSBlock
    NSLog(@"%@",[[[[block class] superclass] superclass] superclass]);//NSObject
    NSLog(@"%@",[[[[[block class] superclass] superclass] superclass] superclass]);//(null)
}

//只访问了static变量：__NSGlobalBlock
void blockTest3() {
    static int a = 10;
    void (^block)(void) = ^() {
        NSLog(@"this is a block %d",a);
    };
    
    NSLog(@"%@",[block class]);// __NSGlobalBlock__
    NSLog(@"%@",[[block class] superclass]);//__NSGlobalBlock
    NSLog(@"%@",[[[block class] superclass] superclass]);//NSBlock
    NSLog(@"%@",[[[[block class] superclass] superclass] superclass]);//NSObject
    NSLog(@"%@",[[[[[block class] superclass] superclass] superclass] superclass]);//(null)
}

/**
 
struct __block_impl {
  void *isa;//isa指针
  int Flags;
  int Reserved;
  void *FuncPtr;//block封装的函数指针
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;//保存block的大小
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  int age;//捕获的外部变量
    
    //构造器
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _age, int flags=0) : age(_age) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};

void simulateBlockStruct() {
    int age = 10;
    void (^block)(int,int) = ^(int a,int b) {
        NSLog(@"this is a block age:%d",age);
        NSLog(@"this is a block");
    };
    
    struct __main_block_impl_0 *block_struct = (__bridge struct __main_block_impl_0 *)block;
    
    block(10,10);
    
//    block_struct->impl.FuncPtr(10,10);
}

*/


void (^block)(void);
void testBlock() {
    int age = 10;
    block = ^{
        NSLog(@"block-------%d",age);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        blockTest1();

//        Person *p = [[Person alloc]init];
//        NSLog(@"end");
        
//        Test *t = [Test new];
//        t.name = @"test";
//        NSLog(@"name:%@",t.name);
        
//        testBlock();
//        block();
        
        __block int age = 10;
        __block NSObject *obj = [NSObject new];
        void (^block)(void) = ^{
            age = 20;
            obj = nil;
            NSLog(@"age:%d",age);
        };
    }
    return 0;
}
