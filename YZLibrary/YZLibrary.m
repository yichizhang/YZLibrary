#include "YZLibrary.h"

@implementation YZLibrary

+ (NSString*)boolInTrueOrFalseString:(BOOL)bValue{
    
    return (bValue ? @"true" : @"false");
    
}

+ (NSString *)userDocumentDir {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return documentDir;

}

+ (BOOL)quickCopyFileInBundle:(NSString*)fileName toDir:(NSString*)dirPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *newFilePath = [dirPath stringByAppendingPathComponent:fileName];
    BOOL success = [fileManager fileExistsAtPath:newFilePath];
    
    if(!success) {
        NSString *currentFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
        
        success = [fileManager copyItemAtPath:currentFilePath toPath:newFilePath error:&error];
        
        if (!success)
            NSAssert1(0, @"Failed to create writable database file with message ‘%@’.", [error localizedDescription]);
    }
    
    return success;
}

+ (NSString *)monthNameFromNumber0To11:(NSUInteger)month{

    return [self monthNameFromNumber1To12:month+1];
}

+ (NSString *)monthNameFromNumber1To12:(NSUInteger)month{

    NSString* monthName = @"Undefined";
    
    switch (month) {
        case 1:  monthName = @"January"; break;
        case 2:  monthName = @"February"; break;
        case 3:  monthName = @"March"; break;
        case 4:  monthName = @"April"; break;
        case 5:  monthName = @"May"; break;
        case 6:  monthName = @"June"; break;
        case 7:  monthName = @"July"; break;
        case 8:  monthName = @"August"; break;
        case 9:  monthName = @"September"; break;
        case 10: monthName = @"October"; break;
        case 11: monthName = @"November"; break;
        case 12: monthName = @"December"; break;

        default:
            break;
    }
    
    return monthName;
}

+ (NSString *)letterFromNumber1To24:(NSUInteger)number{
    
    NSString* returnName = @"?";
    
    switch (number) {
        case 1:  returnName = @"A"; break;
        case 2:  returnName = @"B"; break;
        case 3:  returnName = @"C"; break;
        case 4:  returnName = @"D"; break;
        case 5:  returnName = @"E"; break;
        case 6:  returnName = @"F"; break;
        case 7:  returnName = @"G"; break;
        case 8:  returnName = @"H"; break;
        case 9:  returnName = @"I"; break;
        case 10: returnName = @"J"; break;
        case 11: returnName = @"K"; break;
        case 12: returnName = @"L"; break;
            
        default:
            break;
    }
    
    return returnName;
}

+ (NSString *)secondsToMinuteString:(int)seconds{
    
    return [NSString
            stringWithFormat:
            @"%i:%02i",
            seconds / 60,
            seconds % 60
            ];
}

#pragma mark - REUSABLE METHODS
+ (void) copyDatabaseIfNeeded:(NSString*)dbFileName{
    
    //Using NSFileManager we can perform many file system operations.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath = [YZLibrary getDBPath:dbFileName];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    NSLog(@"%@",dbPath);
    
    if(!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbFileName];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        
        if (!success)
            NSAssert1(0, @"Failed to create writable database file with message ‘%@’.", [error localizedDescription]);
    }
}

+ (NSString *) getDBPath:(NSString*)dbFileName {
    //Search for standard documents using NSSearchPathForDirectoriesInDomains
    //First Param = Searching the documents directory
    //Second Param = Searching the Users directory and not the System
    //Expand any tildes and identify home directories.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:dbFileName];
}

+ (NSString *)stringFromIntNumber:(int)intNumber{
    
    return [NSString stringWithFormat:@"%i", intNumber];
}

+ (BOOL)createDirectoryInApplicationFolder:(NSString*)partialDirToCreate{

    NSFileManager *fm;
    fm = [NSFileManager defaultManager];

    NSError *error = nil;

    NSString *dirToCreate = [NSHomeDirectory() stringByAppendingPathComponent:partialDirToCreate];

    BOOL isDir;
    BOOL fileExists = [fm fileExistsAtPath:dirToCreate isDirectory:&isDir];
    
    if( fileExists ){
        
        if (isDir) {
            
            return YES;
            
        }else{
        
            //Wipe that file
            if ([fm removeItemAtPath:dirToCreate error:&error] != YES){
                NSLog(@"Unable to delete file: %@", [error localizedDescription]);
                return NO;
            }
            
        }
    }
    
    if (!
        [fm createDirectoryAtPath:dirToCreate withIntermediateDirectories:YES attributes:nil error:&error]
        ){
        NSLog(@"Unable to create directory: %@", [error localizedDescription]);
        return NO;
    
    }
    
    return YES;
}

+ (BOOL)isStringValid:(NSString*)string{
    if ([string isEqualToString:@""] || string==nil) {
        return NO;
    }else{
        return YES;
    }
}

+ (NSString*)hmsTimeStringFromSecondsInt:(int)totalSeconds{

    int hours = totalSeconds / 3600;
    totalSeconds -= hours * 3600;
    int minutes = (totalSeconds / 60) ;
    totalSeconds -= minutes * 60;
    int seconds = totalSeconds % 60;
    
    NSMutableString *durationString = [NSMutableString stringWithCapacity:20];
    
    if (hours>0) {
        [durationString appendFormat:@"%d:", hours];
    }
    
    [durationString appendFormat:@"%02d:%02d", minutes, seconds];
    
    return durationString;
}

+ (NSString*)hmsTimeStringFromSecondsFloat:(float)totalSeconds{
    
    return [self hmsTimeStringFromSecondsInt: [[NSNumber numberWithFloat:totalSeconds] intValue] ];
}

+ (CGFloat)viewVisibleHeightConsiderNavBar:(BOOL)navigationBar{
    CGFloat visibleHeight = [[UIScreen mainScreen] bounds].size.height;
    if (navigationBar) {
        visibleHeight -= 44;//self.navigationBar.frame.size.height;
    }
    visibleHeight -= [[UIApplication sharedApplication] statusBarFrame].size.height;
    return visibleHeight;
}

+ (NSString*)fileSizeStringFromByteCount:(int)value
{
    //For converting file size to MB, Gb use below function
    
    double convertedValue = (double)value;
    int multiplyFactor = 0;
    
    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KiB",@"MiB",@"GiB",@"TiB",nil];
    
    while (convertedValue > 1024) {
        convertedValue /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%4.1f %@",convertedValue, [tokens objectAtIndex:multiplyFactor] ];
}

+ (NSString*)homeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file{

    //AT THE MOMENT,
    //PASS IN FOLDER IN ''
    //PASS IN FILE IN THE FORMAT OF 'NAM_EXT'
    NSString *partPath = [NSString
                          stringWithFormat:@"%@/%@",
                          folder,
                          file
                          ];
    NSString  *wholePath = [NSHomeDirectory() stringByAppendingPathComponent:partPath];
    return wholePath;
}

+ (NSString*)tempHomeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file{

    return [YZLibrary homeDirectoryFilePathForFolder:folder
                                                file:[YZLibrary tempFileName:file]
            ];

}

+ (NSString*)tempFileName:(NSString*)file{
    
    NSString *tempFile = [NSString
                          stringWithFormat:@"_%@_",
                          file
                          ];
    return tempFile;
}

+ (int)numberOfDaysSince1970{
    
    return NSTimeIntervalSince1970/86400;
}

+ (CGSize)sizeRequiredForImageSize:(CGSize)imageSize toAspectFitInBox:(CGSize)boxSize{
    
    CGFloat w,h;
    
    //YEAH LEDGED AT MON 23 JUN 11:51:33 PM
    if (imageSize.width / imageSize.height < boxSize.width / boxSize.height) {
        
        h = boxSize.height;
        w = (imageSize.width / imageSize.height) * boxSize.height;
    }else{
        w = boxSize.width;
        h = (imageSize.height / imageSize.width) * boxSize.width;
    }
    return CGSizeMake(w, h);
}

+ (float)randomFloatFromZeroTo:(float)upper{
    int babe = upper * 1000;
    return (float)(arc4random() % babe)/1000;
}

+ (float)randomFloatFromValueToItsNegValue:(float)value{
    return [self randomFloatFromZeroTo:value*2] - value;
}

@end