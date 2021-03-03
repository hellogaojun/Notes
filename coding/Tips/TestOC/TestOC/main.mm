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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

    }
    return 0;
}