//
//  YZLibrary.m
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

#include "YZLibrary.h"

BOOL YZ_IS_EMPTY(id object) {
	
	if (object == nil) {
		return YES;
	} else {
		
		return
		([object respondsToSelector:@selector(length)] && [(NSData*)object length] == 0)
		|| ([object respondsToSelector:@selector(count)] && [(NSArray*)object count] == 0);
	}
	
}

CGRect YZ_CGRectWithCenterAndSize(CGFloat centerX, CGFloat centerY, CGFloat width, CGFloat height) {
	return CGRectMake(
					  centerX - width / 2,
					  centerY - height / 2,
					  width,
					  height
					  );
}

@implementation YZLibrary

+ (CGSize)sizeRequiredForSize:(CGSize)size toAspectFitInBox:(CGSize)boxSize{
    
    CGFloat w,h;
    
    if (size.width / size.height < boxSize.width / boxSize.height) {
        
        h = boxSize.height;
        w = (size.width / size.height) * boxSize.height;
    }else{
        w = boxSize.width;
        h = (size.height / size.width) * boxSize.width;
    }
    return CGSizeMake(w, h);
}

@end