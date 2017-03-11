//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
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
