//
//  NSObject+YZLibrary.m
//  YZLibraryDemo
//
//  Created by Yichi on 15/12/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

#import "NSObject+YZLibrary.h"

@implementation NSObject (YZLibrary)

+ (NSString*)yz_className
{
    NSString* fullClassName = NSStringFromClass(self);
    NSArray* classNameComponents = [fullClassName componentsSeparatedByString:@"."];
    return [classNameComponents lastObject];
}

- (BOOL)yz_isEmpty
{

    return

        ([self respondsToSelector:@selector(length)] && [(NSData*)self length] == 0)
        || ([self respondsToSelector:@selector(count)] && [(NSArray*)self count] == 0);
}

@end
