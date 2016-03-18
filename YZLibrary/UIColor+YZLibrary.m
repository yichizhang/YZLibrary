//
//  UIColor+YZLibrary.m
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
