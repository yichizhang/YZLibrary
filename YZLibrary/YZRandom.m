/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZRandom.h"

@implementation YZRandom

+ (NSInteger)intBetweenZeroAnd:(NSInteger)upper{
    return [YZRandom intBetween:0 and:upper];
}

+ (NSInteger)intBetweenValueAndItsNegativeValue:(NSInteger)value{
    return [YZRandom intBetween:-value and:value];
}

+ (NSInteger)intBetween:(NSInteger)lower and:(NSInteger)upper{
    
    if (lower == upper) {
        return lower;
    }
    
    if (lower > upper) {
        
        NSInteger intermediate;
        intermediate = lower;
        lower = upper;
        upper = intermediate;
    }
    
    return lower + arc4random_uniform(upper - lower + 1);
}


+ (float)floatBetweenZeroAnd:(float)upper{
    return [YZRandom floatBetween:0 and:upper];
}

+ (float)floatBetweenValueAndItsNegativeValue:(float)value{
    return [YZRandom floatBetween:-value and:value];
}

+ (float)floatBetween:(float)lower and:(float)upper{
    
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


+ (float)randomFloatFromZeroTo:(float)upper{
    return [YZRandom floatBetweenZeroAnd:upper];
}

+ (float)randomFloatFromValueToItsNegValue:(float)value{
    return [YZRandom floatBetweenValueAndItsNegativeValue:value];
}

+ (float)randomFloatBetween:(float)lower and:(float)upper {
    return [YZRandom floatBetween:lower and:upper];
}

@end
