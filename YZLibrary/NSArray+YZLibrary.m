/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSArray+YZLibrary.h"

@implementation NSArray (YZLibrary)

int currentIndex = 0;

-(id)yz_randomObject{
    return [ self objectAtIndex: (int) ( arc4random() % [self count] ) ];
}

-(id)yz_nextObject{
    if (currentIndex >= [self count]) {
        currentIndex = 0;
    }
    return [self objectAtIndex:currentIndex++];
}

- (NSArray *)yz_shuffledArray
{
	/* Is this the best way to do it?
     */
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
	for (id anObject in self)
	{
		NSUInteger randomPos = arc4random()%([tmpArray count]+1);
		[tmpArray insertObject:anObject atIndex:randomPos];
	}
    
	return [NSArray arrayWithArray:tmpArray];
}

@end
