//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

typedef struct
{
    NSInteger majorVersion;
    NSInteger minorVersion;
    NSInteger patchVersion;
} YZOperatingSystemVersion;

@interface YZProcessInfo : NSObject

/** A string containing the version of the current device. (read-only)
 
 */
@property(readonly, copy) NSString *operatingSystemVersionString;

/** The version of the current device. (read-only)
 
 */
@property(readonly) YZOperatingSystemVersion operatingSystemVersion;


/** Returns an instance of YZProcessInfo.
 
 */
+ (YZProcessInfo *)processInfo;


/** Returns a Boolean value indicating whether the version of the operating system of the device is the same or later than the given version.
 
 */
- (BOOL)isOperatingSystemAtLeastVersion:(YZOperatingSystemVersion)version;

/** Returns a Boolean value indicating whether the major version of the operating system of the device is the same or later than the given major version. 
 
 */
- (BOOL)isOperatingSystemAtLeastMajorVersion:(NSInteger)majorVersion;

@end
