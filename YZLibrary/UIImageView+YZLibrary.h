//
//  UIImageView+YZLibrary.h
//  ic2
//
//  Created by Yichi on 30/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YZLibrary)

- (void)yz_sizeToFitImageRetainCenter:(BOOL)retainCenter;
- (void)setImageWithLocalImageName:(NSString *)imageName;

@end
