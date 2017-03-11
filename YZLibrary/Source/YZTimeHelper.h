//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
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