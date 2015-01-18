/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZFileHelper.h"

@implementation YZFileHelper

+ (NSString *)userDocumentDirectoryPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return documentDir;
    
}

+ (BOOL)quickCopyFileInBundle:(NSString*)fileName toDirectory:(NSString*)dirPath{
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

+ (NSString *) pathForFileInDocumentDirectory:(NSString*)fileName {

    NSString *documentsDir = [YZFileHelper userDocumentDirectoryPath];
    return [documentsDir stringByAppendingPathComponent:fileName];
}

+ (void) copyFileFromBundleToDocumentDirectoryIfNeeded:(NSString*)fileName{

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *filePath = [YZFileHelper pathForFileInDocumentDirectory:fileName];
    BOOL success = [fileManager fileExistsAtPath:filePath];
    NSLog(@"File exists: %@",filePath);
    
    if(!success) {
        NSString *bundleFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
        success = [fileManager copyItemAtPath:bundleFilePath toPath:filePath error:&error];
        
        if (!success)
            NSAssert1(0, @"Failed to create writable database file with message ‘%@’.", [error localizedDescription]);
    }
}

+ (BOOL)createDirectoryInHomeDirectory:(NSString*)partialDirToCreate{
    
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
    
    NSString *partPath = [NSString
                          stringWithFormat:@"%@/%@",
                          folder,
                          file
                          ];
    NSString  *wholePath = [NSHomeDirectory() stringByAppendingPathComponent:partPath];
    return wholePath;
}

+ (NSString*)tempHomeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file{
    
    return [YZFileHelper homeDirectoryFilePathForFolder:folder
                                                file:[YZFileHelper tempFileName:file]
            ];
    
}

/* This method is a bit ridiculous
 */
+ (NSString*)tempFileName:(NSString*)file{
    
    NSString *tempFile = [NSString
                          stringWithFormat:@"_%@_",
                          file
                          ];
    return tempFile;
}

@end
