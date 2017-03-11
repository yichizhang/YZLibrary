//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSBundle+YZLibrary.h"

@implementation NSBundle (YZLibrary)

- (NSURL *)yz_URLForResourceNamed:(NSString *)fullFileName
{
    NSString *resource = [[fullFileName lastPathComponent] stringByDeletingPathExtension];
    NSString *extension = [fullFileName pathExtension];
    return [self URLForResource:resource withExtension:extension];
}

- (NSString *)yz_pathForResourceNamed:(NSString *)fullFileName
{
    NSString *resource = [[fullFileName lastPathComponent] stringByDeletingPathExtension];
    NSString *extension = [fullFileName pathExtension];
    return [self pathForResource:resource ofType:extension];
}

@end
