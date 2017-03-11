//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSCharacterSet+YZLibrary.h"

@implementation NSCharacterSet (YZLibrary)

+ (instancetype)yz_nonAlphanumericCharacterSet
{
    return [[[self class] alphanumericCharacterSet] invertedSet];
}

@end
