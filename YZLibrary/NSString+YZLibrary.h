//
//  NSString+YZLibrary.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 Type for string conversion options.
 */
typedef NS_OPTIONS(NSUInteger, YZStringConversion)
{
    /**
     No options.
     */
            YZStringConversionNone = 0,
    /**
     Retains the letter case in orginal string.
     */
            YZStringConversionRetainOriginalLetterCase = 1 << 0,
};

@interface NSString (YZLibrary)

/**
 Check if current string is a valid email address
 */
- (BOOL)yz_isValidEmail;

/**
 Returns the full range of the string
 */
- (NSRange)yz_fullRange;

/**
 Finds all occurrences of a string; handle the results with a handling block. 
 
 @param string The string to search for.
 @param options Options for the string search.
 @param handlingBlock The block object to handle each occurrence. `range`: the range of the string. `index`: the order of the occurrence, 0 represents the first. `stop`: tells the method whether to continue or not. Defaults to NO, change it to YES to stop finding for more.
 */
- (void)yz_findString:(NSString *)string
              options:(NSStringCompareOptions)options
        handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL *stop))handlingBlock;

/** 
 Find all occurrences of a string within required range. Handle the results with a handling block.
 
 @param string The string to search for.
 @param options Options for the string search.
 @param range The range to look for the string in.
 @param handlingBlock The block object to handle each occurrence. `range`: the range of the string. `index`: the order of the occurrence, 0 represents the first. `stop`: tells the method whether to continue or not. Defaults to NO, change it to YES to stop finding for more.
 */
- (void)yz_findString:(NSString *)string
              options:(NSStringCompareOptions)options
                range:(NSRange)range
        handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL *stop))handlingBlock;

/** 
 Parse the current string using the data format provided.
 
 @param dateFormat The date format to parse the string with.
 */
- (NSDate *)yz_dateFromString:(NSString *)dateFormat;

/**
 Returns @"true" if the bool value is `YES`; returns @"false" otherwise
 
 @param boolValue The BOOL value to convert to string.
 */
+ (NSString *)yz_stringFromBool:(BOOL)boolValue;

/**
 Returns @"A" for `1` and @"Z" for `26`. Returns @"?" for values out of bounds.
 
 @param number The number to convert to string.
 */
+ (NSString *)yz_letterStringFromNumber1To26:(NSInteger)number;

/**
 Converts an NSInteger to a string with NSString stringWithFormat, using `%i` formatter.
 
 @param intNumber The NSInteger to convert to string.
 */
+ (NSString *)yz_stringFromInt:(NSInteger)intNumber;

/**
 Checks if the string contains decimal digit characters only.
 */
- (BOOL)yz_isDigitsOnly;

/** 
 onverts a `C variable name` string to human readable string.
 
 Example: converts "melbourne_dingo_show" or "melbourneDingoShow", or "mebourne_DingoShow" to "Melbourne Dingo Show"
 */
- (NSString *)yz_humanReadableString;

/**
 Converts a string to a `C variable name` compatible underscore case string.
 
 It calls `yz_underscoreCaseStringWithOptions:` with option `RetainOriginalLetterCase` NOT enabled.
 For Example: it converts `MELBOURNE Dingo` to `melbourne_dingo`
 */
- (NSString *)yz_underscoreCaseString;

/** Converts a string to a `C variable name` compatible underscore case string.
 
 @param options Conversion options. 1.`RetainOriginalLetterCase` If switched on, `melbourne Dingo SHOW` will be converted to `melbourne_Dingo_SHOW`; otherwise, it will be converted to `melbourne_dingo_show`
 */
- (NSString *)yz_underscoreCaseStringWithOptions:(YZStringConversion)options;

/** Converts a string to a `C variable name` compatible camel case string.
 
 It calls `yz_camelCaseStringWithOptions:` with option `RetainOriginalLetterCase` enabled.
 For Example: it converts `melbourne Dingo` to `melbourneDingo`
 */
- (NSString *)yz_camelCaseString;

/** Convert a string to a `C variable name` compatible camel case string.
 
 @param options Conversion options. 1.`RetainOriginalLetterCase` If switched on, `melbourne Dingo` will be converted to `melbourneDingo`; otherwise, it will be converted to `MelbourneDingo`
 */
- (NSString *)yz_camelCaseStringWithOptions:(YZStringConversion)options;

/** Draws the string, vertically and horizontally cetered inside the specified bounding rectangle in the current graphics context, using the font specified.
 
 @param rect The bounding rectangle in the current graphics context, in which to draw the string.
 @param font The font to use for rendering.
 @param color The color to use for rendering.
 */
- (void)yz_drawAtCenterInRect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color;

@end
