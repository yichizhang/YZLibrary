//
//  YZProcessInfo.m
//  YZLibrary
//
//  Copyright (c) 2016 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "YZProcessInfo.h"

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
