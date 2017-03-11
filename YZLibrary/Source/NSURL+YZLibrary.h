//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface NSURL (YZLibrary)

/** 
 Returns a telephone number URL that starts with `tel:`
 
 @param phoneNumberString The string of the telephone number.
 
 Percent escapes will be added to the phone number string provided.
 */
+ (NSURL *)yz_telURLWithPhoneNumber:(NSString *)phoneNumberString;

/**
 Returns an email URL that starts with `mailto:`
 
 @param emailString The email string.
 
 Percent escapes will be added to the email string provided.
 */
+ (NSURL *)yz_mailtoURLWithEmail:(NSString *)emailString;

@end
