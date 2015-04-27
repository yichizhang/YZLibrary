//
//  YZProcessInfo.h
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
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

#import <Foundation/Foundation.h>

typedef struct {
	NSInteger majorVersion;
	NSInteger minorVersion;
	NSInteger patchVersion;
} YZOperatingSystemVersion;

@interface YZProcessInfo : NSObject

/** A string containing the version of the current device. (read-only)
 
 */
@property (readonly, copy) NSString *operatingSystemVersionString;

/** The version of the current device. (read-only)
 
 */
@property (readonly) YZOperatingSystemVersion operatingSystemVersion;


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
