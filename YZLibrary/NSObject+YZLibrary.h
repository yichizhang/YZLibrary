//
//  NSObject+YZLibrary.h
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
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

#import <Foundation/Foundation.h>

@interface NSObject (YZLibrary)

/**
 Returns the "real" class name without the module name.
 
 NSStringFromClass() now returns the module name, plus class name separated by a dot.
 For example, if you have a module called "Legend" and a class called "AwesomeClass",
 it returns "Legend.AwesomeClass". If you are only interested in the "real" class name, use this method.
 */
+ (NSString*)yz_className;

/**
 Dispatch on the main queue after delay. Shortcut for `dispatch_after(dispatch_time_t when, dispatch_queue_t queue, ^(void)block)`
 
 @param block The block object to dispatch.
 @param delay The time delay before the execution.
 */
- (void)yz_dispatchOnMainQueue:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

/**
 Swift access for NSObject's class method `cancelPreviousPerformRequestsWithTarget:`
 
 @param target The target for requests previously registered with the `performSelector:withObject:afterDelay: instance` method.
 */
+ (void)yz_cancelPerformSelectorsWithTarget:(id)target;

/**
 Swift access for NSObject's class method `cancelPreviousPerformRequestsWithTarget:selector:object:`

 @param target The target for requests previously registered with the `performSelector:withObject:afterDelay:` instance method
 @param selector The selector for requests previously registered with the performSelector:withObject:afterDelay: instance method.
 @param object The argument for requests previously registered with the performSelector:withObject:afterDelay: instance method. Argument equality is determined using isEqual:, so the value need not be the same object that was passed originally. Pass nil to match a request for nil that was originally passed as the argument.
 */
+ (void)yz_cancelPerformSelectorsWithTarget:(id)target selector:(SEL)selector object:(id)object;

/**
 Swift access for NSObject's instance method `performSelector:withObject:afterDelay:`
 
 @param selector A selector that identifies the method to invoke. The method should not have a significant return value and should take a single argument of type id, or no arguments.
 @param object The argument to pass to the method when it is invoked. Pass nil if the method does not take an argument.
 @param delay The minimum time before which the message is sent. Specifying a delay of 0 does not necessarily cause the selector to be performed immediately. The selector is still queued on the thread’s run loop and performed as soon as possible.

 */
- (void)yz_performSelector:(SEL)selector withObject:(id)object afterDelay:(NSTimeInterval)delay;

@end

