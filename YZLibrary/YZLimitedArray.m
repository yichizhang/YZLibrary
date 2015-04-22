/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "YZLimitedArray.h"

@interface YZLimitedArray()

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, assign) NSInteger maxCapacity;

@end

@implementation YZLimitedArray

#pragma mark - Init
- (instancetype)initWithCapacity:(NSUInteger)numItems{
	self = [super init];
	if (self) {
		self.maxCapacity = numItems;
		self.array = [NSMutableArray arrayWithCapacity:numItems];
		self.uniqueElements = NO;
		self.stopsInsertingWhenFull = NO;
		self.insertMode = YZLimitedArrayInsertModeHead;
	}
	return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems uniqueElements:(BOOL)unique{
	self = [super init];
	if (self) {
		self.maxCapacity = numItems;
		self.array = [NSMutableArray arrayWithCapacity:numItems];
		self.uniqueElements = unique;
		self.stopsInsertingWhenFull = NO;
		self.insertMode = YZLimitedArrayInsertModeHead;
	}
	return self;
}

+ (instancetype)arrayWithCapacity:(NSUInteger)numItems{
	
	YZLimitedArray *arr = [[YZLimitedArray alloc] initWithCapacity:numItems];
	return arr;
}

#pragma mark - Main
- (NSUInteger)count{
	return self.array.count;
}

- (id)objectAtIndex:(NSUInteger)index{
	return [self.array objectAtIndex:index];
}

- (void)addObject:(id)anObject{
	
	if (self.uniqueElements) {
		
		if ([self containsObject:anObject]) {
			[self.array removeObject:anObject];
		}
		
	}
	
	if (self.array.count >= self.maxCapacity) {
		
		if (self.stopsInsertingWhenFull) {
			return;
		}
		
		if (self.insertMode == YZLimitedArrayInsertModeHead) {
			
			[self.array removeLastObject];
		} else if (self.insertMode == YZLimitedArrayInsertModeTail) {
			
			[self.array removeObjectAtIndex:0];
		}
	}
	
	if (self.insertMode == YZLimitedArrayInsertModeHead) {
		
		[self.array insertObject:anObject atIndex:0];
	} else if (self.insertMode == YZLimitedArrayInsertModeTail) {
		
		[self.array addObject:anObject];
	}
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index{
	
	if (self.array.count < self.maxCapacity) {
		[self.array insertObject:anObject atIndex:index];
	}
}

- (void)removeLastObject{
	[self.array removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
	[self.array removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
	[self.array replaceObjectAtIndex:index withObject:anObject];
}

@end
