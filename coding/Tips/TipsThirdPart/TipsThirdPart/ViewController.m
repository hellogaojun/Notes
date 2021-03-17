//
//  ViewController.m
//  TipsThirdPart
//
//  Created by admin on 2021/1/28.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "YYModel.h"
#import "Model.h"
#import "MJExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self mj_jsonToModelAndModelToJson];
}

#pragma mark - Json && Model

/**
 
核心实现：ModelSetValueForProperty
 
((void (*)(id, SEL, id))(void *) objc_msgSend)((id)model, meta->_setter, value)
 
 */
- (void)yy_jsonToModelAndModelToJson {
    // create model from json
    YYBook *book = [YYBook yy_modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
    
    // convert model to json
    NSString *json = [book yy_modelToJSONString];
    // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
}

/**
 核心实现：mj_setKeyValues: context:
  
 [object setValue:value forKey:self.name];
 
 
 */
- (void)mj_jsonToModelAndModelToJson {
    // create model from json
    YYBook *book = [YYBook mj_objectWithKeyValues:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
    
    // convert model to json
    NSString *json = [book mj_JSONString];
    // {"name":"Harry Potter","pages":256,"author":{"name":"J.K.Rowling"}}
}


@end
