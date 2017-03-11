//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

@import UIKit;

@interface YZRandomControlCell : UICollectionViewCell

@property(weak, nonatomic) IBOutlet UIButton *generateButton;
@property(weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property(weak, nonatomic) IBOutlet UISlider *lowerBoundSlider;
@property(weak, nonatomic) IBOutlet UISlider *upperBoundSlider;

- (void)setupCellWithData:(id)data;

@end
