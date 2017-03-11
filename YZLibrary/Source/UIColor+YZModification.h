//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

struct YZColorHSBA {
  CGFloat hue;
  CGFloat saturation;
  CGFloat brightness;
  CGFloat alpha;
};

struct YZColorRGBA {
  CGFloat red;
  CGFloat green;
  CGFloat blue;
  CGFloat alpha;
};

@interface UIColor (YZModification)

- (struct YZColorHSBA)yz_hsba;

- (instancetype)yz_colorByModifyingHSBA:(void (^)(struct YZColorHSBA *))modificationBlock;

- (struct YZColorRGBA)yz_rgba;

- (instancetype)yz_colorByModifyingRGBA:(void (^)(struct YZColorRGBA *))modificationBlock;

@end

NS_ASSUME_NONNULL_END
