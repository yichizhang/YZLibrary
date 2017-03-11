//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UIImage (YZLibrary)

/**
 Returns an image created by filling a rectangle with the specified color
 
 @param color	The color of the image you wish to generate.
 @param size	The size of the image you wish to generate.
 */
+ (UIImage *)yz_imageWithColor:(UIColor *)color andSize:(CGSize)size;

/**
 Creates and returns an image object by resizing the receiver to the required size, not retaining original aspect ratio.
 
 @param newSize	The size you wish to resize the image to.
 */
- (UIImage *)yz_imageScaledToSize:(CGSize)newSize;

/**
 Creates and returns an image object by resizing the receiver that fits in required size, retaining original aspect ratio.
 
 @param boxSize		The size of the box that you wish to fit the image in.
 */
- (UIImage *)yz_imageScaledToSizeAspectFitsInBox:(CGSize)boxSize;

/** 
 Returns the size that the receiver will be if you wish to resize it to make it fit in required size, retaining original aspect ratio.

 @param boxSize		The size of the box that you wish to fit the image in.
 */
- (CGSize)yz_sizeRequiredToAspectFitInBox:(CGSize)boxSize;

@end
