//
//  NSObject+YZLibrary.m
//  YZLibrary
//
//  Copyright (c) 2016 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
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

- (void)yz_performSelector:(SEL)selector withObject:(id)object afterDelay:(NSTimeInterval)delay
{
    [self performSelector:selector withObject:object afterDelay:delay];
}

@end

