//
//  YZLibrary.h
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

#define YZ_DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

/** Check if an object is empty by checking its "count" or "length".
 
 */
BOOL YZ_IS_EMPTY(id obj);

/** Build a CGRect with required size and center point.
 
 */
CGRect YZ_CGRectWithCenterAndSize(CGFloat centerX, CGFloat centerY, CGFloat width, CGFloat height);

@interface YZLibrary : NSObject

/** Calculates the new size for current size to fit in a required `box`, retaining original aspect ratio.
 
 */
+ (CGSize)sizeRequiredForSize:(CGSize)size toAspectFitInBox:(CGSize)boxSize;

@end