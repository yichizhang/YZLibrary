//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZFileHelper.h"

@implementation YZFileHelper

+ (NSString *)userDocumentDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return documentDir;
}

+ (NSString *)pathForDirectoryInUserDomain:(NSSearchPathDirectory)directory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)fileSizeStringFromByteCount:(int)byteCount
{
    //For converting file size to MB, Gb use below function
    double value = (double) byteCount;
    int multiplyFactor = 0;

    NSArray *units = [NSArray arrayWithObjects:@"bytes", @"KiB", @"MiB", @"GiB", @"TiB", nil];

    while (value > 1024) {
        value /= 1024;
        multiplyFactor++;
    }

    return [NSString stringWithFormat:@"%4.1f %@",
                                      value,
                                      [units objectAtIndex:multiplyFactor]
    ];
}

@end
