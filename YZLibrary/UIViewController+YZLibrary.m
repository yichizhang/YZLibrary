//
//  UIViewController+YZLibrary.m
//  ic2
//
//  Created by Yichi on 10/07/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "UIViewController+YZLibrary.h"

@implementation UIViewController (YZLibrary)

- (void)yz_ios7EdgeForExtendedLayout{

    self.automaticallyAdjustsScrollViewInsets = false;
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

@end
