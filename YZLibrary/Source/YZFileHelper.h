//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface YZFileHelper : NSObject

/**
 Returns the user's document directory
 */
+ (NSString *)userDocumentDirectoryPath;

/**
 Returns the first path string for the specified directories in user domain.
 
 @param directory		The search path directory. The supported values are described in NSSearchPathDirectory.
 */
+ (NSString *)pathForDirectoryInUserDomain:(NSSearchPathDirectory)directory;

/**
 Returns a human readable string of the size of the file, based on its byte count.
 
 @param byteCount		The number of bytes.
 */
+ (NSString *)fileSizeStringFromByteCount:(int)byteCount;

@end
