//
//  NSArray+YZLibrary.m
//  twoamlockout
//
//  Created by Yichi Zhang on 21/04/13.
//  Copyright (c) 2013 Yichi Zhang. All rights reserved.
//

#import "NSArray+YZLibrary.h"

@implementation NSArray (YZLibrary)

int currentIndex = 0;

-(id)randomObject{
    return [ self objectAtIndex: (int) ( arc4random() % [self count] ) ];
}

-(id)nextObject{
    if (currentIndex >= [self count]) {
        currentIndex = 0;
    }
    return [self objectAtIndex:currentIndex++];
}

- (NSArray *) shuffled
{
	// create temporary autoreleased mutable array
	NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
	for (id anObject in self)
	{
		NSUInteger randomPos = arc4random()%([tmpArray count]+1);
		[tmpArray insertObject:anObject atIndex:randomPos];
	}
    
	return [NSArray arrayWithArray:tmpArray];  // non-mutable autoreleased copy
}

@end
