//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIImage+YZLibrary.h"
#import "YZMathUtil.h"

@implementation UIImage (YZLibrary)

+ (UIImage *)yz_imageWithColor:(UIColor *)color andSize:(CGSize)size
{

    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;

}

- (UIImage *)yz_imageScaledToSize:(CGSize)newSize
{

    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}

- (UIImage *)yz_imageScaledToSizeAspectFitsInBox:(CGSize)boxSize
{

    CGSize theSize = [self yz_sizeRequiredToAspectFitInBox:boxSize];
    return [self yz_imageScaledToSize:theSize];
}

- (CGSize)yz_sizeRequiredToAspectFitInBox:(CGSize)boxSize
{

    return [YZMathUtil sizeRequiredForSize:self.size toAspectFitInBox:boxSize];
}

@end
