//
//  NSObject+YZLibrary.h
//  YZLibraryDemo
//
//  Created by Yichi on 15/12/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YZLibrary)

/** Returns the "real" class name without the module name.
 
 NSStringFromClass() now returns the module name, plus class name separated by a dot.
 For example, if you have a module called "Legend" and a class called "AwesomeClass",
 it returns "Legend.AwesomeClass". If you are only interested in the "real" class name, use this method.
 */
+ (NSString*)yz_className;


- (BOOL)yz_isEmpty;

@end
