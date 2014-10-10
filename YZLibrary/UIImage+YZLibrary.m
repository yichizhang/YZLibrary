//
//  UIImage+YZLibrary.m
//  iJincai
//
//  Created by Yichi Zhang on 6/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImage+YZLibrary.h"
#import "YZLibrary.h"

@implementation UIImage (YZLibrary)

+(UIImage *)yz_autoResolutionImageNamed:(NSString *)name{

    //BOOL hasHighResScreen = NO;
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];

        if (scale > 1.0) {
            //hasHighResScreen = YES;
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

    return [YZLibrary sizeRequiredForImageSize:self.size toAspectFitInBox:boxSize];
}

- (CGRect)yz_frameRequiredToAspectFitInFrame:(CGRect)frame{
    
    CGSize size = [YZLibrary sizeRequiredForImageSize:self.size toAspectFitInBox:frame.size];
    CGRect newFrame = CGRectMake(frame.origin.x,
                                 frame.origin.y,
                                 size.width,
                                 size.height);
    return newFrame;
    
}

+ (CGSize)yz_scaleSizeAccordingToScreenScale:(CGSize)size{
    
    //BOOL hasHighResScreen = NO;
    
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        CGFloat scale = [[UIScreen mainScreen] scale];
        
        //if (scale > 1.0) {
        //hasHighResScreen = YES;
            
        CGSize newSize = CGSizeMake(size.width*scale, size.height*scale);
        return newSize;

        
    }else {
        
        
        return size;
    }
    
}

@end
