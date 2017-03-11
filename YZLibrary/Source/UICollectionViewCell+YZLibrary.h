//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

@import UIKit;

@interface UICollectionViewCell (YZLibrary)

/** 
 Dequeue a collection view cell, using default identifier, which is identical to the class name (without package name) of the cell.
 
 @param collectionView  The collection view you wish to dequeue the cell from.
 @param indexPath       The index path specifying the location of the cell.
 */
+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath;

/**
 Dequeue a collection view cell, using custom identifier.

 @param collectionView  The collection view you wish to dequeue the cell from.
 @param indexPath       The index path specifying the location of the cell.
 @param reuseIdentifier	The reuse identifier for the specified cell. This parameter must not be `nil`.
 */
+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath
                          andReuseIdentifier:(NSString *)reuseIdentifier;

/** 
 Register a collection view cell with the collection view, using the class name (without package name) as the identifier and the name of the nib file.
 
 @param collectionView	The collection view you wish to register the cell for.
 */
+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView;

/**
 Register a collection view cell with the collection view, using custom identifier and custom nib file name.
 
 @param collectionView	The collection view you wish to register the cell for.
 @param nibFileName		The name of the nib file, without any leading path information.
 @param reuseIdentifier	The reuse identifier for the specified cell. This parameter must not be `nil`.
 */
+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView
                     withNibFileName:(NSString *)nibFileName
                  andReuseIdentifier:(NSString *)reuseIdentifier;

/** 
 Register a collection view cell with the collection view, using custom identifier the class name (without package name) as the name of the nib file.
 
 @param collectionView	The collection view you wish to register the cell for.
 @param reuseIdentifier	The reuse identifier for the specified cell. This parameter must not be `nil`.
 */
+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView
                 withReuseIdentifier:(NSString *)reuseIdentifier;
@end
