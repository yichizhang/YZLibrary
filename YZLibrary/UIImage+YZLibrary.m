/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "UIImage+YZLibrary.h"
#import "YZLibrary.h"

@implementation UIImage (YZLibrary)

+ (UIImage *)yz_autoResolutionImageNamed:(NSString *)name{

    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];

        if (scale > 2.0) {
            
            NSString *newName = [NSString stringWithFormat:@"%@@3x.%@",
                                 [name stringByDeletingPathExtension],
                                 [name pathExtension]
                                 ];
            return [UIImage imageNamed:newName];
            
        }else if (scale > 1.0) {
            
            NSString *newName = [NSString stringWithFormat:@"%@@2x.%@",
                                 [name stringByDeletingPathExtension],
                                 [name pathExtension]
                                 ];
            
            return [UIImage imageNamed:newName];
            
        }else{
            
            return [UIImage imageNamed:name];
        }
        
        
    }else {
        
        
        return [UIImage imageNamed:name];
    }
    
}

- (UIImage *)yz_imageScaledToSize:(CGSize)newSize {
    
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (UIImage *)yz_imageScaledToSizeAspectFitsInBox:(CGSize)boxSize {
    
    CGSize theSize = [self yz_sizeRequiredToAspectFitInBox:boxSize];
    return [self yz_imageScaledToSize:theSize];
}

- (CGSize)yz_sizeRequiredToAspectFitInBox:(CGSize)boxSize{

    return [YZLibrary sizeRequiredForSize:self.size toAspectFitInBox:boxSize];
}

- (CGRect)yz_frameRequiredToAspectFitInFrame:(CGRect)frame{
    
    CGSize size = [YZLibrary sizeRequiredForSize:self.size toAspectFitInBox:frame.size];
    CGRect newFrame = CGRectMake(frame.origin.x,
                                 frame.origin.y,
                                 size.width,
                                 size.height);
    return newFrame;
    
}

+ (CGSize)yz_scaleSizeAccordingToScreenScale:(CGSize)size{
    
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        
        CGFloat scale = [[UIScreen mainScreen] scale];
            
        CGSize newSize = CGSizeMake(size.width*scale, size.height*scale);
        return newSize;
 
    }else {
        
        return size;
    }
    
}

@end
