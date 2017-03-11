//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface NSData (YZLibrary)

/**
 *  Returns the MD5 hash of data contained in the receiver.
 */
- (NSString *)yz_MD5String;

@end