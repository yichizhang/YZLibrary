//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface YZSimpleTextCell : UICollectionViewCell

@property(weak, nonatomic) IBOutlet UILabel *mainLabel;

- (void)setupCellWithData:(id)data;

@end
