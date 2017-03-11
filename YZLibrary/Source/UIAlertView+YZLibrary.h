//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (YZLibrary)

/** 
 Show an alert view with title and message. Use this method when you just wish to show some information to the user and do not care about the response.
 
 @param title The string that appears in the alert view's title bar.
 @param message Descriptive text that provides more details than the title.
 @param cancelButtonTitle The title of the cancel button. If you pass in `nil` or an empty string, default value "OK" will be used.
 */
+ (void)yz_showWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;

@end
