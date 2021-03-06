//
//  YZTimeHelper.h
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

#import <Foundation/Foundation.h>

@interface YZTimeHelper : NSObject


/** Converts the number of seconds to a string, in the format of `m:ss`.
 
 For example,
 `59` will be converted to `0:59`,
 `60` will be converted to `1:00`.
 */
+ (NSString *)secondsToMinuteString:(int)seconds;


/** Converts the number of seconds to a string, in the format of `H:mm:ss`.
 
 The hour value will be omitted if the total time is less than 1 hour.
 For example,
 `3599` will be converted to `59:59`,
 `3600` will be converted to `1:00:00`.
 */
+ (NSString *)hmsTimeStringFromSecondsInt:(int)totalSeconds;

@end