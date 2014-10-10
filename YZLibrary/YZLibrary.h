/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>

#define YZ_DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface YZLibrary : NSObject{

}

+ (NSString*)boolInTrueOrFalseString:(BOOL)bValue;
+ (NSString *)userDocumentDir;
+ (BOOL)quickCopyFileInBundle:(NSString*)fileName toDir:(NSString*)dirPath;
+ (NSString *)monthNameFromNumber0To11:(NSUInteger)month;
+ (NSString *)monthNameFromNumber1To12:(NSUInteger)month;
+ (NSString *)letterFromNumber1To24:(NSUInteger)number;

+ (NSString *)secondsToMinuteString:(int)seconds;

+ (NSString *)getDBPath:(NSString*)dbFileName;
+ (void) copyDatabaseIfNeeded:(NSString*)dbFileName;

+ (NSString *)stringFromIntNumber:(int)intNumber;

+ (BOOL)createDirectoryInApplicationFolder:(NSString*)partialDirToCreate;

+ (BOOL)isStringValid:(NSString*)string;

+ (NSString*)hmsTimeStringFromSecondsInt:(int)totalSeconds;
+ (NSString*)hmsTimeStringFromSecondsFloat:(float)totalSeconds;

+ (CGFloat)viewVisibleHeightConsiderNavBar:(BOOL)navigationBar;

+ (NSString*)fileSizeStringFromByteCount:(int)value;

+ (NSString*)homeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file;
+ (NSString*)tempHomeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file;
+ (NSString*)tempFileName:(NSString*)file;

+ (int)numberOfDaysSince1970;

+ (CGSize)sizeRequiredForImageSize:(CGSize)imageSize toAspectFitInBox:(CGSize)boxSize;

+ (float)randomFloatFromZeroTo:(float)upper;
+ (float)randomFloatFromValueToItsNegValue:(float)value;

@end