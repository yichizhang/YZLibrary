//
//  UICollectionViewCell+YZLibrary.h
//  YZLibrary
//
//  Copyright (c) 2016 Yichi Zhang
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
