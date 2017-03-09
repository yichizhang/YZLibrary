//
//  Copyright (c) 2017-present, Yichi Zhang.
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSString+YZVersionComparision.h"

static NSString *const kVersionSeparator = @".";

@implementation NSString (YZVersionComparision)

-(NSComparisonResult)yz_compareToVersion:(NSString *)version {
  NSComparisonResult ret = NSOrderedSame;
  
  NSArray *curr = [self componentsSeparatedByString:kVersionSeparator];
  NSArray *other = [version componentsSeparatedByString:kVersionSeparator];
  
  NSNumber *(^getAsNumber)(NSArray *, NSInteger) =
  ^NSNumber *(NSArray * a, NSInteger i) {
    return (i < a.count) ? @([a[i] integerValue]) : @0;
  };
  
  NSInteger m = MAX(curr.count, other.count);
  for (NSInteger i = 0; i < m; i++) {
    NSComparisonResult r = [getAsNumber(curr, i) compare:getAsNumber(other, i)];
    
    if (r != NSOrderedSame) {
      ret = r;
      break;
    }
  }
  
  return ret;
}

@end
