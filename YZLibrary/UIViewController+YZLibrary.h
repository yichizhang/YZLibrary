//
//  UIViewController+YZLibrary.h
//  YZLibrary
//
//  Copyright (c) 2016 Yichi Zhang
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

#import <UIKit/UIKit.h>

@interface UIViewController (YZLibrary)

/**
 Sets the view controller's `automaticallyAdjustsScrollViewInsets` to NO, and `edgesForExtendedLayout` to `UIRectEdgeNone`
 */
- (void)yz_ios7EdgeForExtendedLayout;

/**
 Shorthand for "[self presentViewController:vc animated:YES completion:nil];", presenting a view controller with animation but no completion block
 
 @param viewController		The view controller to display over the current view controller's content. 
 */
- (void)yz_presentViewController:(UIViewController *)viewController;

/**
 Push a view controller onto self (if self is a navigationController) or self's navigationController with animation
 
 @param viewController		The view controller to push onto the stack. This object cannot be a tab bar controller. If the view controller is already on the navigation stack, this method throws an exception.
 Shorthand for "[self.navigationController pushViewController:vc animated:YES];"
 */
- (void)yz_pushViewController:(UIViewController *)viewController;

/**
 Dismiss a view controller with animation, but no completion block.
 
 Shorthand for "[self dismissViewControllerAnimated:YES completion:nil];"
 */
- (void)yz_dismissViewController;

/**
 Dismiss the view controller or pop it. If self has a navigationController and the count of its view controllers exceeds 1, pop it from the navigationController; otherwise, dismiss it.
 */
- (void)yz_autoDismissViewController;

/**
 *  Add a child view controller to the receiver's `view`, making necessary state transitioning calls.
 *
 *  @param viewController The child view controller
 */
- (void)yz_addChildViewController:(UIViewController *)viewController;

/**
 *  Add a child view controller to contentView (must be the receiver's `view`'s subview), making necessary state transitioning calls.
 *
 *  @param viewController The child view controller
 *  @param contentView    Receiver's view's subview
 */
- (void)yz_addChildViewController:(UIViewController *)viewController
                           toView:(UIView *)contentView;

/**
 *  Remove receiver from its parent view controller, making necessary state transitioning calls.
 */
- (void)yz_removeFromParentViewController;

@end
