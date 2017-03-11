//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface NSBundle (YZLibrary)

/**
 Returns the URL for a resource in the bundle. Pass in the full filename, with extension, e.g. `filename.ext`
 
 @param fullFileName The file name, including the extension
 */
- (NSURL *)yz_URLForResourceNamed:(NSString *)fullFileName;

/**
 Returns the path for a resource in the bundle. Pass in the full filename, with extension, e.g. `filename.ext`
 
 @param fullFileName The file name, including the extension
 */
- (NSString *)yz_pathForResourceNamed:(NSString *)fullFileName;

@end
