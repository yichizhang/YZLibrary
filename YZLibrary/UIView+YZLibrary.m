//
//  UIView+YZLibrary.m
//  ic2
//
//  Created by Yichi on 4/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "UIView+YZLibrary.h"

@implementation UIView (YZLibrary)

- (void)yz_addShadow{
    
    UIBezierPath *shadowPath =
    [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}


- (void)yz_addWhiteFrame{

    [self.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderWidth: 5.0];
}

@end
