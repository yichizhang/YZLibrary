//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSDate+YZLibrary.h"

@implementation NSDate (YZLibrary)

- (NSString*)yz_stringFromDate:(NSString*)dateFormat{
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = dateFormat;
	return [formatter stringFromDate:self];
}

@end
