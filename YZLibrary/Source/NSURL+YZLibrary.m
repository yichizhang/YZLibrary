//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSURL+YZLibrary.h"

@implementation NSURL (YZLibrary)

+ (NSURL *)yz_telURLWithPhoneNumber:(NSString *)phoneNumberString
{
    return [NSURL URLWithString:
            [NSString stringWithFormat:@"tel:%@", [phoneNumberString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
    ];
}

+ (NSURL *)yz_mailtoURLWithEmail:(NSString *)emailString
{
    return [NSURL URLWithString:
            [NSString stringWithFormat:@"mailto:%@", [emailString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
    ];
}

@end
