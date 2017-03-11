//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface NSArray (YZLibrary)

/**
 Returns the object at the index. Returns `nil` if the index is out of bounds.
 
 @param index The index of the object.
 */
- (id)yz_objectAtIndex:(NSInteger)index;

/**
 Returns a random object in the array.
 */
- (id)yz_randomObject;

/**
 Returns an array with the order of elements shuffled.
 */
- (NSArray *)yz_shuffledArray;

@end
