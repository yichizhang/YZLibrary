//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSData+YZLibrary.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (YZLibrary)

- (NSString *)yz_MD5String
{
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];

    CC_MD5(self.bytes, (CC_LONG) self.length, buffer);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", buffer[i]];
    }

    return output;
}

@end