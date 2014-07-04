//
//  YZTheme.h
//  F-TRAINERP1
//
//  Created by Yichi Zhang on 13/09/12.
//
//

#import <Foundation/Foundation.h>
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

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