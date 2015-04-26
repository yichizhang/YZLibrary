//
//  YZRandom.m
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
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

#import "YZRandom.h"

@implementation YZRandom

+ (NSInteger)intBetweenZeroAnd:(NSInteger)upper{
    return [YZRandom intBetweenLower:0 upper:upper];
}

+ (NSInteger)intBetweenValueAndItsNegativeValue:(NSInteger)value{
    return [YZRandom intBetweenLower:-value upper:value];
}

+ (NSInteger)intBetweenLower:(NSInteger)lower upper:(NSInteger)upper{
    
    if (lower == upper) {
        return lower;
    }
    
    if (lower > upper) {
        
        NSInteger intermediate;
        intermediate = lower;
        lower = upper;
        upper = intermediate;
    }
	
	u_int32_t upperBound = (u_int32_t)upper - (u_int32_t)lower + 1;
	
    return lower + arc4random_uniform(upperBound);
}


+ (float)floatBetweenZeroAnd:(float)upper{
    return [YZRandom floatBetweenLower:0 upper:upper];
}

+ (float)floatBetweenValueAndItsNegativeValue:(float)value{
    return [YZRandom floatBetweenLower:-value upper:value];
}

+ (float)floatBetweenLower:(float)lower upper:(float)upper{
    
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
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + lower;
}

@end
