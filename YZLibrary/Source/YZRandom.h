//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
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
