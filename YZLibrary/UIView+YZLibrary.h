//
//  UIView+YZLibrary.h
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
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
+ (nullable instancetype)yz_loadFromNibNamed:(nonnull NSString*)nibName bundle:(nullable NSBundle*)bundleOrNil;

/**
 Bring the view to the front by calling `bringSubviewToFront:` on its superview.
 */
- (void)yz_bringToFront;

/**
 Returns an image of the receiver. The scale factor of the image is equal to the scale factor of the main screen.
 */
- (nonnull UIImage*)yz_captureImage;

/**
 Returns an image of the receiver. The image will be rendered to the required scale factor.
 
 @param scaleFactor		The scale factor you wish to render the image to.
 */
- (nonnull UIImage*)yz_captureImageWithScaleFactor:(CGFloat)scaleFactor;

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

/** Add Autolayout constraints, make current view's edges adhere to the edges of the superview, with spacing specified in `insets`.
 
 @param insets		The edge insets between the receiver and its superview.
 */
- (void)yz_setupConstraintsAdhereToEdgesOfSuperviewWithInsets:(UIEdgeInsets)inset;


@end
