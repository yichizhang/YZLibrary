//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZRandom.h"

@implementation YZRandom

+ (NSInteger)intBetweenZeroAnd:(NSInteger)upper
{
    return [YZRandom intBetweenLower:0 upper:upper];
}

+ (NSInteger)intBetweenValueAndItsNegativeValue:(NSInteger)value
{
    return [YZRandom intBetweenLower:-value upper:value];
}

+ (NSInteger)intBetweenLower:(NSInteger)lower upper:(NSInteger)upper
{

    if (lower == upper) {
        return lower;
    }

    if (lower > upper) {

        NSInteger intermediate;
        intermediate = lower;
        lower = upper;
        upper = intermediate;
    }

    u_int32_t upperBound = (u_int32_t) upper - (u_int32_t) lower + 1;

    return lower + arc4random_uniform(upperBound);
}


+ (float)floatBetweenZeroAnd:(float)upper
{
    return [YZRandom floatBetweenLower:0 upper:upper];
}

+ (float)floatBetweenValueAndItsNegativeValue:(float)value
{
    return [YZRandom floatBetweenLower:-value upper:value];
}

+ (float)floatBetweenLower:(float)lower upper:(float)upper
{

    if (lower == upper) {
        return lower;
    }

    if (lower > upper) {

        float intermediate;
        intermediate = lower;
        lower = upper;
        upper = intermediate;
    }

    float diff = upper - lower;
    return (((float) (arc4random() % ((unsigned) RAND_MAX + 1)) / RAND_MAX) * diff) + lower;
}

@end
