//
//  YZLibrary.h
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

#import <Foundation/Foundation.h>

#define YZ_DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

/**
 Check if an object is empty by checking its "count" or "length".
 
 @param object		The object you wish to check.
 */
BOOL YZ_IS_EMPTY(id object);

/**
 Build a CGRect with required size and center point.
 
 @param centerX		The x-coordinate of the rectangle's center point.
 @param centerY		The y-coordinate of the rectangle's center point.
 @param width		The width of the rectangle.
 @param height		The height of the rectangle.
 */
CGRect YZ_CGRectWithCenterAndSize(CGFloat centerX, CGFloat centerY, CGFloat width, CGFloat height);

@interface YZLibrary : NSObject

/**
 Calculates the new size for current size to fit in a required `box`, retaining original aspect ratio.
 
 @param size		The original size.
 @param boxSize		The size of the box that you wish to fit the orginal size into.
 */
+ (CGSize)sizeRequiredForSize:(CGSize)size toAspectFitInBox:(CGSize)boxSize;

@end