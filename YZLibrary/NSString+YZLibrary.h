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

- (BOOL)yz_isStringValid;
- (BOOL)yz_isValidEmail;
- (NSRange)yz_fullRange;

+ (NSString*)yz_stringFromBool:(BOOL)boolValue;
+ (NSString *)yz_letterStringFromNumber1To26:(int)number;
+ (NSString*)yz_stringFromInt:(int)intNumber;
- (BOOL)yz_isDigitsOnly;

/** Example: converts "melbourne_dingo_show" or "melbourneDingoShow", or "mebourne_DingoShow" to "Melbourne Dingo Show"
 
 */
- (NSString*)yz_humanReadableString;


@end
