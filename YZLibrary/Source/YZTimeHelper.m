//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZTimeHelper.h"

@implementation YZTimeHelper

+ (NSString *)secondsToMinuteString:(int)seconds
{

    return [NSString
            stringWithFormat:
                    @"%i:%02i",
                    seconds / 60,
                    seconds % 60
    ];
}

+ (NSString *)hmsTimeStringFromSecondsInt:(int)totalSeconds
{

    int hours = totalSeconds / 3600;
    totalSeconds -= hours * 3600;
    int minutes = (totalSeconds / 60);
    totalSeconds -= minutes * 60;
    int seconds = totalSeconds % 60;

    NSMutableString *durationString = [NSMutableString stringWithCapacity:20];

    if (hours > 0) {
        [durationString appendFormat:@"%d:", hours];
    }

    [durationString appendFormat:@"%02d:%02d", minutes, seconds];

    return durationString;
}

@end
