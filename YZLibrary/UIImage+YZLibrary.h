//
//  UIImage+YZLibrary.h
//  iJincai
//
//  Created by Yichi Zhang on 6/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YZLibrary)

+(UIImage *)yz_autoResolutionImageNamed:(NSString *)name;
- (UIImage *)yz_imageScaledToSize:(CGSize)newSize;
- (UIImage *)yz_imageScaledToSizeAspectFitsInBox:(CGSize)boxSize;
- (CGSize)yz_sizeRequiredToAspectFitInBox:(CGSize)boxSize;
- (CGRect)yz_frameRequiredToAspectFitInFrame:(CGRect)frame;

@end
