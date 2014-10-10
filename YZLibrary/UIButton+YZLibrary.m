//
//  UIButton+YZLibrary.m
//  ic2
//
//  Created by Yichi on 4/06/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "UIButton+YZLibrary.h"

@implementation UIButton (YZLibrary)


- (void)yz_covertToAwesomeLedgeButton{
    [self setTitleColor:[UIColor whiteColor]
                            forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    [self.layer setCornerRadius:5.0];
}

@end
