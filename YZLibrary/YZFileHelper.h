/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <Foundation/Foundation.h>

@interface YZFileHelper : NSObject

/** Returns the user's document directory
 
 */
+ (NSString *)userDocumentDirectoryPath;

//FIXME: Deprecated
+ (BOOL)quickCopyFileInBundle:(NSString*)fileName toDirectory:(NSString*)dirPath;

//FIXME: Deprecated
+ (NSString *)pathForFileInDocumentDirectory:(NSString*)fileName;

//FIXME: Deprecated
+ (void)copyFileFromBundleToDocumentDirectoryIfNeeded:(NSString*)fileName;

//FIXME: Deprecated
+ (BOOL)createDirectoryInHomeDirectory:(NSString*)partialDirToCreate;

/** Returns a human readable string of the size of the file, based on its byte count.
 
 */
+ (NSString*)fileSizeStringFromByteCount:(int)value;

//FIXME: Deprecated
+ (NSString*)homeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file;

//FIXME: Deprecated
+ (NSString*)tempHomeDirectoryFilePathForFolder:(NSString*)folder file:(NSString*)file;

//FIXME: Deprecated
+ (NSString*)tempFileName:(NSString*)file;

@end
