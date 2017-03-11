//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

@interface YZMathUtil : NSObject

/**
 Calculates the new size for current size to fit in a required `box`, retaining original aspect ratio.
 
 @param size		The original size.
 @param boxSize		The size of the box that you wish to fit the orginal size into.
 */
+ (CGSize)sizeRequiredForSize:(CGSize)size toAspectFitInBox:(CGSize)boxSize;

@end
