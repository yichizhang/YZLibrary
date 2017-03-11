//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZLimitedArray.h"

@interface YZLimitedArray ()

@property(nonatomic, strong) NSMutableArray *array;
@property(nonatomic, assign) NSInteger maxCapacity;

@end

@implementation YZLimitedArray

#pragma mark - Init

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
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

- (instancetype)initWithCapacity:(NSUInteger)numItems uniqueElements:(BOOL)unique
{
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

+ (instancetype)arrayWithCapacity:(NSUInteger)numItems
{

    YZLimitedArray *arr = [[YZLimitedArray alloc] initWithCapacity:numItems];
    return arr;
}

#pragma mark - Main

- (NSUInteger)count
{
    return self.array.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self.array objectAtIndex:index];
}

- (void)addObject:(id)anObject
{

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
        }
        else if (self.insertMode == YZLimitedArrayInsertModeTail) {

            [self.array removeObjectAtIndex:0];
        }
    }

    if (self.insertMode == YZLimitedArrayInsertModeHead) {

        [self.array insertObject:anObject atIndex:0];
    }
    else if (self.insertMode == YZLimitedArrayInsertModeTail) {

        [self.array addObject:anObject];
    }
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{

    if (self.array.count < self.maxCapacity) {
        [self.array insertObject:anObject atIndex:index];
    }
}

- (void)removeLastObject
{
    [self.array removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self.array removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [self.array replaceObjectAtIndex:index withObject:anObject];
}

@end
