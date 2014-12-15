//
//  NSObject+YZLibrary.m
//  YZLibraryDemo
//
//  Created by Yichi on 15/12/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "NSObject+YZLibrary.h"

@implementation NSObject (YZLibrary)

+ (NSString*)yz_className{
	/*
	 In Swift, NSStringFromClass now returns the bundle name, plus class name separated by a dot.
	 With this method, you get the 'pure' class name.
	 */
	NSString *fullClassName = NSStringFromClass(self);
	NSArray *classNameComponents = [fullClassName componentsSeparatedByString:@"."];
	return [classNameComponents lastObject];
}

@end
