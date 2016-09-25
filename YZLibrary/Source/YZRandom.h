//
//  YZRandom.h
//  YZLibrary
//
//  Copyright (c) 2016 Yichi Zhang
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

#import <Foundation/Foundation.h>

@interface YZRandom : NSObject

/** Returns an integer that is between 0 and the upper bound provided.
 
 */
+ (NSInteger)intBetweenZeroAnd:(NSInteger)upper;

/** Returns an integer that is between the value provided and its negative value.
 
 */
+ (NSInteger)intBetweenValueAndItsNegativeValue:(NSInteger)value;

/** Returns an integer that is between the lower and upper bounds provided.
 
 Both lower bound and upper bound are inclusive.
 */
+ (NSInteger)intBetweenLower:(NSInteger)lower upper:(NSInteger)upper;

/** Returns a float number that is between 0 and the upper bound provided.
 
 */
+ (float)floatBetweenZeroAnd:(float)upper;

/** Returns a float number that is between the value provided and its negative value.
 
 */
+ (float)floatBetweenValueAndItsNegativeValue:(float)value;

/** Returns a float number that is between the lower and upper bounds provided.
 
 */
+ (float)floatBetweenLower:(float)lower upper:(float)upper;

@end
