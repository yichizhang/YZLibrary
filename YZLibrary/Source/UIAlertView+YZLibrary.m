//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIAlertView+YZLibrary.h"

@implementation UIAlertView (YZLibrary)

+ (void)yz_showWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:(cancelButtonTitle.length > 0 ? cancelButtonTitle : @"OK") otherButtonTitles:nil];
    [av show];
}

@end
