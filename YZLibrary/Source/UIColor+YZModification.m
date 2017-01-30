//
//  Copyright (c) 2017-present, Yichi Zhang.
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIColor+YZModification.h"

@implementation UIColor (YZModification)

- (struct YZColorHSBA)yz_hsba
{
  struct YZColorHSBA hsba;

  [self getHue:&hsba.hue
    saturation:&hsba.saturation
    brightness:&hsba.brightness
         alpha:&hsba.alpha];

  return hsba;
}

- (instancetype)yz_colorByModifyingHSBA:(void (^)(struct YZColorHSBA *))modificationBlock
{
  struct YZColorHSBA hsba = [self yz_hsba];

  modificationBlock(&hsba);

  return [UIColor colorWithHue:hsba.hue
                    saturation:hsba.saturation
                    brightness:hsba.brightness
                         alpha:hsba.alpha];
}

- (struct YZColorRGBA)yz_rgba
{
  struct YZColorRGBA rgba;

  [self getRed:&rgba.red
         green:&rgba.green
          blue:&rgba.blue
         alpha:&rgba.alpha];

  return rgba;
}

- (instancetype)yz_colorByModifyingRGBA:(void (^)(struct YZColorRGBA *))modificationBlock
{
  struct YZColorRGBA rgba = [self yz_rgba];

  modificationBlock(&rgba);

  return [UIColor colorWithRed:rgba.red
                         green:rgba.green
                          blue:rgba.blue
                         alpha:rgba.alpha];
}

@end
