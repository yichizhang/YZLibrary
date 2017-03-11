//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#include "YZMathUtil.h"

BOOL YZ_IS_EMPTY(id object)
{

    if (object == nil) {
        return YES;
    }
    else {

        return
                ([object respondsToSelector:@selector(length)] && [(NSData *) object length] == 0)
                        || ([object respondsToSelector:@selector(count)] && [(NSArray *) object count] == 0);
    }

}

CGRect YZ_CGRectWithCenterAndSize(CGFloat centerX, CGFloat centerY, CGFloat width, CGFloat height)
{
    return CGRectMake(
            centerX - width / 2,
            centerY - height / 2,
            width,
            height
    );
}

@implementation YZMathUtil

+ (CGSize)sizeRequiredForSize:(CGSize)size toAspectFitInBox:(CGSize)boxSize
{

    CGFloat w, h;

    if (size.width / size.height < boxSize.width / boxSize.height) {

        h = boxSize.height;
        w = (size.width / size.height) * boxSize.height;
    }
    else {
        w = boxSize.width;
        h = (size.height / size.width) * boxSize.width;
    }
    return CGSizeMake(w, h);
}

@end
