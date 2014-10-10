//
//  UIImage+YZLibrary.m
//  iJincai
//
//  Created by Yichi Zhang on 6/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIColor+YZLibrary.h"
#import "YZLibrary.h"

@implementation UIColor (YZLibrary)

+ (UIColor*)iOS7BlueColor
{
    return [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
}

+ (UIColor*)appKeyWindowTintColor
{
    return [[[UIApplication sharedApplication] keyWindow] tintColor];
}

@end
