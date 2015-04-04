/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>

@interface NSString (YZLibrary)

/** Check if current string is a valid email address
 */
- (BOOL)yz_isValidEmail;

/** Returns the full range of the string
 */
- (NSRange)yz_fullRange;

/** Find all occurrences of a string; handle the results with a handling block. `index` in the handling block indicates the occurrence of the string, 0 represents the first. Change `stop` in the handling block to stop finding more.
 */
- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock;

/** Find all occurrences of a string within defined range. Handle the results with a handling block. `index` in the handling block indicates the occurrence of the string, 0 represents the first. Change `stop` in the handling block to stop finding more.
 */
- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options range:(NSRange)range handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock;

/** Parse the current string using the data format provided.
 */
- (NSDate*)yz_dateFromString:(NSString*)dateFormat;

/** Returns @"true" if the bool value is `YES`; returns @"false" otherwise
 */
+ (NSString*)yz_stringFromBool:(BOOL)boolValue;

/** Returns @"A" for `1` and @"Z" for `26`. Returns @"?" for values out of bounds.
 */
+ (NSString*)yz_letterStringFromNumber1To26:(NSInteger)number;

/** Converts an int number to a string with NSString stringWithFormat, using `%i` formatter.
 */
+ (NSString*)yz_stringFromInt:(NSInteger)intNumber;

/** Checks if the string contains character in [NSCharacterSet decimalDigitCharacterSet] only.
 */
- (BOOL)yz_isDigitsOnly;

// FIXME: The implementation contains serious problems
// TODO: Should implement stringByRemovingCharactersInSet
- (NSString*)yz_stringByRemovingNonAlphanumericCharacters;
- (NSString*)yz_stringByRemovingNonAlphanumericCharactersKeepSpaces:(BOOL)keepSpaces;

/** Example: converts "melbourne_dingo_show" or "melbourneDingoShow", or "mebourne_DingoShow" to "Melbourne Dingo Show"
 
 */
- (NSString*)yz_humanReadableString;

/** Example: converts "Melbourne Dingo Show" to "melbourne_dingo_show"
 
 */
- (NSString*)yz_underscoreCaseString;

/** Example: converts "Melbourne Dingo Show" to "melbourneDingoShow"
 
 */
- (NSString*)yz_camelCaseString;

@end
