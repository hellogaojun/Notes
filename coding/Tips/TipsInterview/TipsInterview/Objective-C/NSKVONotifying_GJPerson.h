//
//  NSKVONotifying_GJPerson.h
//  TipsInterview
//
//  Created by admin on 2021/2/25.
//

#import "GJPerson.h"

NS_ASSUME_NONNULL_BEGIN
//使用了KVO的对象，系统会动态生成一个NSKVONotifying_XXX类
@interface NSKVONotifying_GJPerson : GJPerson

@end

NS_ASSUME_NONNULL_END
