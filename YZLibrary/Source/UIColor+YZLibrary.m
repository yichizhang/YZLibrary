//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIColor+YZLibrary.h"
#import "YZRandom.h"

@implementation UIColor (YZLibrary)

+ (UIColor *)yz_iOS7BlueColor
{
    return [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue:1.0 alpha:1.0];
}

+ (UIColor *)yz_appKeyWindowTintColor
{
    return [[[UIApplication sharedApplication] keyWindow] tintColor];
}

+ (UIColor *)yz_randomBrightColor
{
    CGFloat hue = [YZRandom floatBetweenZeroAnd:1.0];
    CGFloat saturation = [YZRandom floatBetweenLower:0.5 upper:1.0];
    CGFloat brightness = [YZRandom floatBetweenLower:0.5 upper:1.0];
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.f];
}

- (instancetype)yz_complementaryColor
{

    CGFloat hue;
    [self getHue:&hue saturation:nil brightness:nil alpha:nil];

    CGFloat newHue = fmodf(hue + 0.5, 1.0);

    return [self yz_colorWithHueComponent:newHue];
}

- (instancetype)yz_colorWithHueComponent:(CGFloat)hue
{

    CGFloat saturation, brightness, alpha;
    [self getHue:nil saturation:&saturation brightness:&brightness alpha:&alpha];

    return [[self class] colorWithHue:hue
                           saturation:saturation
                           brightness:brightness
                                alpha:alpha];
}

@end
