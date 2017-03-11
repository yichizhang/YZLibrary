//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "NSArray+YZLibrary.h"

@implementation NSArray (YZLibrary)

- (id)yz_objectAtIndex:(NSInteger)index
{
    if (index >= 0 && index < [self count]) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (id)yz_randomObject
{
    return [self objectAtIndex:(int) (arc4random() % [self count])];
}

- (NSArray *)yz_shuffledArray
{
    return [self sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        // Return -1, 0, or 1
        return arc4random() % 3 - 1;
    }];
}

@end
