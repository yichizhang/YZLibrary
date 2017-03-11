//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZProcessInfo.h"
#import <UIKit/UIKit.h>

@implementation YZProcessInfo

+ (YZProcessInfo *)processInfo
{
    return [[YZProcessInfo alloc] init];
}

- (NSString *)operatingSystemVersionString
{
    return [[UIDevice currentDevice] systemVersion];
}

- (YZOperatingSystemVersion)operatingSystemVersion
{
    NSString *versionString = [self operatingSystemVersionString];
    NSArray *versionComponentArray = [versionString componentsSeparatedByString:@"."];
    YZOperatingSystemVersion version;
    version.majorVersion = 0;
    version.minorVersion = 0;
    version.patchVersion = 0;

    NSInteger i = 0;
    for (NSString *component in versionComponentArray) {
        switch (i) {
            case 0:
                version.majorVersion = [component integerValue];
                break;
            case 1:
                version.minorVersion = [component integerValue];
                break;
            case 2:
                version.patchVersion = [component integerValue];
                break;
            default:
                break;
        }
        i++;
    }

    return version;
}

- (BOOL)isOperatingSystemAtLeastVersion:(YZOperatingSystemVersion)version
{
    YZOperatingSystemVersion osVersion = [self operatingSystemVersion];
    return (osVersion.majorVersion >= version.majorVersion) &&
            (osVersion.minorVersion >= version.minorVersion) &&
            (osVersion.patchVersion >= version.patchVersion);
}

- (BOOL)isOperatingSystemAtLeastMajorVersion:(NSInteger)majorVersion
{
    YZOperatingSystemVersion osVersion = [self operatingSystemVersion];
    return osVersion.majorVersion >= majorVersion;
}

@end
