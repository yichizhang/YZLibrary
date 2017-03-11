//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//
#import "NSObject+YZLibrary.h"

@implementation NSObject (YZLibrary)

+ (NSString *)yz_className
{
    NSString *fullClassName = NSStringFromClass(self);
    NSArray *classNameComponents = [fullClassName componentsSeparatedByString:@"."];
    return [classNameComponents lastObject];
}

- (void)yz_dispatchOnMainQueue:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    dispatch_time_t dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(dispatchTime, dispatch_get_main_queue(), ^{
        block();
    });
}

+ (void)yz_cancelPerformSelectorsWithTarget:(id)target
{
    [NSObject cancelPreviousPerformRequestsWithTarget:target];
}

+ (void)yz_cancelPerformSelectorsWithTarget:(id)target selector:(SEL)selector object:(id)object
{
    [NSObject cancelPreviousPerformRequestsWithTarget:target selector:selector object:object];
}

- (id)yz_performSelectorIfResponds:(SEL)aSelector
{
  return [self respondsToSelector:aSelector] ? [self performSelector:aSelector] : nil;
}

- (void)yz_performSelector:(SEL)selector withObject:(id)object afterDelay:(NSTimeInterval)delay
{
    [self performSelector:selector withObject:object afterDelay:delay];
}

@end

