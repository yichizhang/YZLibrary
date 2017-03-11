//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YZLimitedArrayInsertMode)
{
    YZLimitedArrayInsertModeHead = 0,
    YZLimitedArrayInsertModeTail
};

@interface YZLimitedArray : NSMutableArray

@property(nonatomic, assign) BOOL uniqueElements;
@property(nonatomic, assign) BOOL stopsInsertingWhenFull;
@property(nonatomic, assign) YZLimitedArrayInsertMode insertMode;

/** Returns an array, initialized with the maximum number of objects allowed.
 
 */
- (instancetype)initWithCapacity:(NSUInteger)numItems;

/** Returns an array, initialized with the maximum number of objects allowed. You can specify whether the array should check to ensure its objects are unique.
 
 */
- (instancetype)initWithCapacity:(NSUInteger)numItems uniqueElements:(BOOL)unique;

/** Creates and returns an YZLimitedArray object with the maximum number of objects allowed.
 
 */
+ (instancetype)arrayWithCapacity:(NSUInteger)numItems;

/** The number of objects in the array. It will not be greater than the maximum capacity specified.
 
 */
- (NSUInteger)count;

/** Returns the object located at the specified index.
 
 */
- (id)objectAtIndex:(NSUInteger)index;

/** Add the object to the array. The position of the insertion is specified by `insertMode`. If the current array is already full, whether it will be inserted or not will depend on `stopsInsertingWhenFull`.
 
 */
- (void)addObject:(id)anObject;

/** Inserts an object at the `index`, if the receiver is not full.
 
 */
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;

/** Removes all occurrences in the array of a given object.
 
 */
- (void)removeLastObject;

/** Removes the object at `index`.
 
 */
- (void)removeObjectAtIndex:(NSUInteger)index;

/** Replaces the object at `index` with `anObject`.
 
 */
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
