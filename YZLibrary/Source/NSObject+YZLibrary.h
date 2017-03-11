//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface NSObject (YZLibrary)

/**
 Returns the "real" class name without the module name.
 
 NSStringFromClass() now returns the module name, plus class name separated by a dot.
 For example, if you have a module called "Legend" and a class called "AwesomeClass",
 it returns "Legend.AwesomeClass". If you are only interested in the "real" class name, use this method.
 */
+ (NSString *)yz_className;

/**
 Dispatch on the main queue after delay. Shortcut for `dispatch_after(dispatch_time_t when, dispatch_queue_t queue, ^(void)block)`
 
 @param block The block object to dispatch on the main queue.
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
 Checks the receiver whether it receives the selector, if yes, the method would be invoked
 */
- (id)yz_performSelectorIfResponds:(SEL)aSelector;

/**
 Swift access for NSObject's instance method `performSelector:withObject:afterDelay:`
 
 @param selector A selector that identifies the method to invoke. The method should not have a significant return value and should take a single argument of type id, or no arguments.
 @param object The argument to pass to the method when it is invoked. Pass nil if the method does not take an argument.
 @param delay The minimum time before which the message is sent. Specifying a delay of 0 does not necessarily cause the selector to be performed immediately. The selector is still queued on the thread’s run loop and performed as soon as possible.

 */
- (void)yz_performSelector:(SEL)selector withObject:(id)object afterDelay:(NSTimeInterval)delay;

@end

