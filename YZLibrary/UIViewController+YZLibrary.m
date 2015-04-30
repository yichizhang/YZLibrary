//
//  UIViewController+YZLibrary.m
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "UIViewController+YZLibrary.h"

@implementation UIViewController (YZLibrary)

- (void)yz_ios7EdgeForExtendedLayout{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
	}
}

- (void)yz_presentViewController:(UIViewController*)viewController{
	
	[self presentViewController:viewController animated:YES completion:nil];
}

- (void)yz_pushViewController:(UIViewController*)viewController{
	
	if ([self isKindOfClass:[UINavigationController class]]) {
		
		[(UINavigationController*)self pushViewController:viewController animated:YES];
	}else {
		
		[self.navigationController pushViewController:viewController animated:YES];
	}
}

- (void)yz_dismissViewController{
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)yz_autoDismissViewController{
	
	if (self.navigationController) {
		if (self.navigationController.viewControllers.count > 1) {
			[self.navigationController popViewControllerAnimated:YES];
		}else{
			[self yz_dismissViewController];
		}
	}else{
		[self yz_dismissViewController];
	}
}

@end
