//
//  NSURL+YZLibrary.m
//  YZLibraryDemo
//
//  Created by Yichi on 9/03/2015.
//  Copyright (c) 2015 yichizhang. All rights reserved.
//

#import "NSURL+YZLibrary.h"

@implementation NSURL (YZLibrary)

- (instancetype)yz_telURLWithPhoneNumber:(NSString *)phoneNumberString {
	return [NSURL URLWithString:
			[NSString stringWithFormat:@"tel:%@", [phoneNumberString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
			];
}

@end
