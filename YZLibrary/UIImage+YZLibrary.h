/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <UIKit/UIKit.h>

@interface UIImage (YZLibrary)

/** Returns an image created by filling a rectangle with the specified color
 */
+ (UIImage *)yz_imageWithColor:(UIColor*)color andSize:(CGSize)size;

/** Creates and returns an image object by resizing the receiver to the required size, not retaining original aspect ratio.
 */
- (UIImage *)yz_imageScaledToSize:(CGSize)newSize;

/** Creates and returns an image object by resizing the receiver that fits in required size, retaining original aspect ratio.
 */
- (UIImage *)yz_imageScaledToSizeAspectFitsInBox:(CGSize)boxSize;

/** Returns the size that the receiver will be if you wish to resize it to make it fit in required size, retaining original aspect ratio.
 */
- (CGSize)yz_sizeRequiredToAspectFitInBox:(CGSize)boxSize;

@end
