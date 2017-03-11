//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UIView (YZLibrary)

/** 
 Loads the view from the nib file located in main bundle that has the same name as the class.
 */
+ (nullable instancetype)yz_loadFromNib;

/**
 Loads the view from a nib file.
 
 @param nibName			The name of the nib file, without any leading path information.
 @param bundleOrNil		The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
 */
+ (nullable instancetype)yz_loadFromNibNamed:(nonnull NSString *)nibName bundle:(nullable NSBundle *)bundleOrNil;

/**
 Bring the view to the front by calling `bringSubviewToFront:` on its superview.
 */
- (void)yz_bringToFront;

/**
 Send the view to back by calling `sendSubviewToBack:` on its superview.
 */
- (void)yz_sendToBack;

/**
 Returns an image of the receiver. The scale factor of the image is equal to the scale factor of the main screen.
 */
- (nonnull UIImage *)yz_captureImage;

/**
 Returns an image of the receiver. The image will be rendered to the required scale factor.
 
 @param scaleFactor		The scale factor you wish to render the image to.
 */
- (nonnull UIImage *)yz_captureImageWithScaleFactor:(CGFloat)scaleFactor;

/**
 Goes up the view hierarchy, returns the receiver's parent collection view cell, if there is one.
 */
- (nullable UICollectionViewCell *)yz_parentCollectionViewCell;

/**
 Goes up the view hierarchy, returns the receiver's parent table view cell, if there is one.
 */
- (nullable UITableViewCell *)yz_parentTableViewCell;

/**  Preload keyboard so that user won't feel the delay when typing for the first time.
 It is recommended to call this method on the key and visible window upon application start-up.
 
 E.g. Put:
 
 [self.window makeKeyAndVisible]; 
 [self.window yz_preloadKeyboard];
 
 in your app delegate's "application:didFinishLaunchingWithOptions:" method.
 */
- (void)yz_preloadKeyboard;


/** Add Autolayout constraints, make current view's edges adhere to the edges of the superview, with no spacing.
 
 */
- (void)yz_setupConstraintsAdhereToEdgesOfSuperview;

/** Add Autolayout constraints, make current view's edges adhere to the edges of the superview, with spacing specified in `insets`.
 
 @param inset  The edge insets between the receiver and its superview.
 */
- (void)yz_setupConstraintsAdhereToEdgesOfSuperviewWithInsets:(UIEdgeInsets)inset;


@end
