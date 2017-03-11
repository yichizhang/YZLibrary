//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZSimpleTextCell.h"

@implementation YZSimpleTextCell
- (void)setupCellWithData:(id)data
{
    self.mainLabel.textColor = [UIColor blackColor];
    self.mainLabel.font = [UIFont boldSystemFontOfSize:16.0];
    self.mainLabel.text = data;
}

@end
