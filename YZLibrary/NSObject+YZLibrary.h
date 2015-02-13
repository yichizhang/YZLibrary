/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */
#import <Foundation/Foundation.h>

@interface NSObject (YZLibrary)

/** Check if an object is empty by checking its "count" or "length".
 
 */
BOOL YZ_IS_EMPTY(id obj);

/** Returns the "real" class name without the module name.
 
 NSStringFromClass() now returns the module name, plus class name separated by a dot.
 For example, if you have a module called "Legend" and a class called "AwesomeClass",
 it returns "Legend.AwesomeClass". If you are only interested in the "real" class name, use this method.
 */
+ (NSString*)yz_className;

/** THIS METHOD IS DEPRECATED. DO NOT USE BECAUSE IT RETURNS FALSE (i.e. not empty) IF THE OBJECT IS NIL. THEN YOU HAVE TO DO SOMETHING "LIKE if( myString != nil && myString [yz_isEmpty] )" WHICH IS TERRIBLE. USE "YZ_IS_EMPTY(id obj)" INSTEADD.
 
 Check an NSString, NSArray, NSDictioary or NSData etc. whether its empty.
 
 */
- (BOOL)yz_isEmpty DEPRECATED_ATTRIBUTE;

/** Check an object if it is empty. Returns true if the object is nil.
 
 */
+ (BOOL)yz_isEmpty:(id) obj;

/** Dispatch on the main queue after delay. Shortcut for dispatch_after(dispatch_time_t when, dispatch_queue_t queue, ^(void)block)} 
 
 */
- (void)yz_dispatchOnMainQueue:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

