/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZTimeHelper.h"

@implementation YZTimeHelper

+ (NSString *)secondsToMinuteString:(int)seconds{
    
    return [NSString
            stringWithFormat:
            @"%i:%02i",
            seconds / 60,
            seconds % 60
            ];
}

+ (NSString *)monthNameFromNumber0To11:(NSUInteger)month{
    
    return [self monthNameFromNumber1To12:month+1];
}

+ (NSString *)monthNameFromNumber1To12:(NSUInteger)month{
    
    NSString* monthName = @"Undefined";
    
    switch (month) {
        case 1:  monthName = @"January"; break;
        case 2:  monthName = @"February"; break;
        case 3:  monthName = @"March"; break;
        case 4:  monthName = @"April"; break;
        case 5:  monthName = @"May"; break;
        case 6:  monthName = @"June"; break;
        case 7:  monthName = @"July"; break;
        case 8:  monthName = @"August"; break;
        case 9:  monthName = @"September"; break;
        case 10: monthName = @"October"; break;
        case 11: monthName = @"November"; break;
        case 12: monthName = @"December"; break;
            
        default:
            break;
    }
    
    return monthName;
}

+ (NSString*)hmsTimeStringFromSecondsInt:(int)totalSeconds{
    
    int hours = totalSeconds / 3600;
    totalSeconds -= hours * 3600;
    int minutes = (totalSeconds / 60) ;
    totalSeconds -= minutes * 60;
    int seconds = totalSeconds % 60;
    
    NSMutableString *durationString = [NSMutableString stringWithCapacity:20];
    
    if (hours>0) {
        [durationString appendFormat:@"%d:", hours];
    }
    
    [durationString appendFormat:@"%02d:%02d", minutes, seconds];
    
    return durationString;
}

+ (NSString*)hmsTimeStringFromSecondsFloat:(float)totalSeconds{
    
    return [self hmsTimeStringFromSecondsInt: [[NSNumber numberWithFloat:totalSeconds] intValue] ];
}

+ (int)numberOfDaysSince1970{
    
    return NSTimeIntervalSince1970/86400;
}

@end
