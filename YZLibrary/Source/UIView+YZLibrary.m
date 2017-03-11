//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UIView+YZLibrary.h"
#import "NSObject+YZLibrary.h"

@implementation UIView (YZLibrary)

+ (nullable instancetype)yz_loadFromNib
{
  return [[self class] yz_loadFromNibNamed:[self yz_className] bundle:nil];
}

+ (nullable instancetype)yz_loadFromNibNamed:(nonnull NSString *)nibName bundle:(nullable NSBundle *)bundleOrNil
{
  static UINib *__nib;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    __nib = [UINib nibWithNibName:nibName bundle:bundleOrNil];
  });
  
  return [[__nib instantiateWithOwner:nil options:nil] firstObject];
}

- (void)yz_bringToFront
{
  [self.superview bringSubviewToFront:self];
}

- (void)yz_sendToBack
{
  [self.superview sendSubviewToBack:self];
}

- (nonnull UIImage *)yz_captureImage
{
  return [self yz_captureImageWithScaleFactor:UIScreen.mainScreen.scale];
}

- (nonnull UIImage *)yz_captureImageWithScaleFactor:(CGFloat)scaleFactor
{
  UIGraphicsBeginImageContextWithOptions(self.bounds.size,
                                         NO,
                                         scaleFactor
                                         );
  [self.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

- (nullable UICollectionViewCell *)yz_parentCollectionViewCell
{
  id viewSuperView = [self superview];
  while (viewSuperView != nil) {
    if ([viewSuperView isKindOfClass:[UICollectionViewCell class]]) {
      return (UICollectionViewCell *) viewSuperView;
    }
    else {
      viewSuperView = [viewSuperView superview];
    }
  }
  return nil;
}

- (nullable UITableViewCell *)yz_parentTableViewCell
{
  id viewSuperView = [self superview];
  while (viewSuperView != nil) {
    if ([viewSuperView isKindOfClass:[UITableViewCell class]]) {
      return (UITableViewCell *) viewSuperView;
    }
    else {
      viewSuperView = [viewSuperView superview];
    }
  }
  return nil;
}

- (void)yz_preloadKeyboard
{
  UITextField *tempTextField = [[UITextField alloc] init];
  [self addSubview:tempTextField];
  [tempTextField becomeFirstResponder];
  [tempTextField resignFirstResponder];
  [tempTextField removeFromSuperview];
}

- (void)yz_setupConstraintsAdhereToEdgesOfSuperview
{
  [self yz_setupConstraintsAdhereToEdgesOfSuperviewWithInsets:UIEdgeInsetsZero];
}

- (void)yz_setupConstraintsAdhereToEdgesOfSuperviewWithInsets:(UIEdgeInsets)inset
{
  UIView *contentView = self.superview;
  UIView *itemView = self;
  
  self.translatesAutoresizingMaskIntoConstraints = NO;
  
  NSLayoutConstraint *topConstraint =
  [NSLayoutConstraint
   constraintWithItem:itemView
   attribute:NSLayoutAttributeTop
   relatedBy:NSLayoutRelationEqual
   toItem:contentView
   attribute:NSLayoutAttributeTop
   multiplier:1.0f
   constant:inset.top];
  
  NSLayoutConstraint *leadingConstraint =
  [NSLayoutConstraint
   constraintWithItem:itemView
   attribute:NSLayoutAttributeLeading
   relatedBy:NSLayoutRelationEqual
   toItem:contentView
   attribute:NSLayoutAttributeLeading
   multiplier:1.0f
   constant:inset.left];
  
  NSLayoutConstraint *bottomConstraint =
  [NSLayoutConstraint
   constraintWithItem:contentView
   attribute:NSLayoutAttributeBottom
   relatedBy:NSLayoutRelationEqual
   toItem:itemView
   attribute:NSLayoutAttributeBottom
   multiplier:1.0f
   constant:inset.bottom];
  
  NSLayoutConstraint *trailingConstraint =
  [NSLayoutConstraint
   constraintWithItem:contentView
   attribute:NSLayoutAttributeTrailing
   relatedBy:NSLayoutRelationEqual
   toItem:itemView
   attribute:NSLayoutAttributeTrailing
   multiplier:1.0f
   constant:inset.right];
  
  [contentView addConstraint:topConstraint];
  [contentView addConstraint:leadingConstraint];
  [contentView addConstraint:bottomConstraint];
  [contentView addConstraint:trailingConstraint];
}

@end
