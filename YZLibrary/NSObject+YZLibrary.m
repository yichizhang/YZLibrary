/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */
#import "NSObject+YZLibrary.h"

@implementation NSObject (YZLibrary)

BOOL YZ_IS_EMPTY(id obj) {
	
	if (obj == nil) {
		return YES;
	} else {
		
		return
		([obj respondsToSelector:@selector(length)] && [(NSData*)obj length] == 0)
		|| ([obj respondsToSelector:@selector(count)] && [(NSArray*)obj count] == 0);
	}
	
}

+ (NSString*)yz_className
{
    NSString* fullClassName = NSStringFromClass(self);
    NSArray* classNameComponents = [fullClassName componentsSeparatedByString:@"."];
    return [classNameComponents lastObject];
}

- (BOOL)yz_isEmpty
{

    return

        ([self respondsToSelector:@selector(length)] && [(NSData*)self length] == 0)
        || ([self respondsToSelector:@selector(count)] && [(NSArray*)self count] == 0);
}

- (void)yz_dispatchOnMainQueue:(void (^)(void))block afterDelay:(NSTimeInterval)delay{
	dispatch_time_t dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
	dispatch_after(dispatchTime, dispatch_get_main_queue(), ^{
		block();
	});
}

@end

