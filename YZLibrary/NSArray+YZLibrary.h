//
//  NSArray+YZLibrary.h
//  twoamlockout
//
//  Created by Yichi Zhang on 21/04/13.
//  Copyright (c) 2013 Yichi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YZLibrary)

-(id)randomObject;
-(id)nextObject;
- (NSArray *) shuffled;

@end
