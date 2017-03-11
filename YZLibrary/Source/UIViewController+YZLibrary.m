//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIViewController+YZLibrary.h"

@implementation UIViewController (YZLibrary)

- (void)yz_ios7EdgeForExtendedLayout
{
    self.automaticallyAdjustsScrollViewInsets = NO;

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)yz_presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)yz_pushViewController:(UIViewController *)viewController
{
    if ([self isKindOfClass:[UINavigationController class]]) {

        [(UINavigationController *) self pushViewController:viewController animated:YES];
    }
    else {

        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)yz_dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)yz_autoDismissViewController
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else {
            [self yz_dismissViewController];
        }
    }
    else {
        [self yz_dismissViewController];
    }
}

- (void)yz_addChildViewController:(UIViewController *)viewController
{
    [self yz_addChildViewController:viewController toView:self.view];
}

- (void)yz_addChildViewController:(UIViewController *)viewController
                           toView:(UIView *)contentView
{
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
    [contentView addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)yz_removeFromParentViewController
{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [self didMoveToParentViewController:nil];
}

@end
