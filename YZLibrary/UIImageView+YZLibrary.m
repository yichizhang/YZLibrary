//
//  UIImageView+YZLibrary.m
//  ic2
//
//  Created by Yichi on 30/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "UIImageView+YZLibrary.h"
#import "UIImage+YZLibrary.h"

@implementation UIImageView (YZLibrary)

- (void)yz_sizeToFitImageRetainCenter:(BOOL)retainCenter{

    CGPoint center = self.center;
    
    self.frame = [self.image yz_frameRequiredToAspectFitInFrame:self.frame];
    
    if (retainCenter) {
        self.center = center;
    }
    
}

- (void)setImageWithLocalImageName:(NSString *)imageName{

    [self setImage:
     [UIImage imageNamed:imageName]
     ];
}

@end
