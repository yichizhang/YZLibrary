//
//  UIColor+YZLibrary.h
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

#import <UIKit/UIKit.h>

@interface UIColor (YZLibrary)

/**
 Returns iOS 7's system blue color
 */
+ (UIColor *)yz_iOS7BlueColor;

/**
 Returns the tint color of the application's key window
 */
+ (UIColor *)yz_appKeyWindowTintColor;

/**
 Returns a random bright color
 */
+ (UIColor *)yz_randomBrightColor;

/**
 Creates and returns a color object that's the complement of the receiver.
 */
- (instancetype)yz_complementaryColor;

/**
 Creates and returns a color object that has the component values as the receiver, but has the specified hue component.
 
 @param hue		The hue component of the new color object in the HSB color space, specified as a value from 0.0 to 1.0.
 */
- (instancetype)yz_colorWithHueComponent:(CGFloat)hue;

@end
