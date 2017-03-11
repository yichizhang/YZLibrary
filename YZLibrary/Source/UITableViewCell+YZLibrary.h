//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (YZLibrary)

/** 
 Dequeue a table view cell, using default identifier, which is identical to the class name (without package name) of the cell.
 
 @param tableView			The table view you wish to dequeue the cell from.
 @param indexPath			The index path specifying the location of the cell.
 */
+ (instancetype)yz_dequeueFromTableView:(UITableView *)tableView
                           forIndexPath:(NSIndexPath *)indexPath;

/**
 Dequeue a table view cell, using custom identifier.
 
 @param tableView			The table view you wish to dequeue the cell from.
 @param indexPath			The index path specifying the location of the cell.
 @param reuseIdentifier		A string identifying the cell object to be reused. This parameter must not be nil.
 */
+ (instancetype)yz_dequeueFromTableView:(UITableView *)tableView
                           forIndexPath:(NSIndexPath *)indexPath
                     andReuseIdentifier:(NSString *)reuseIdentifier;

/**
 Register a table view cell with the table view, using the class name (without package name) as the identifier and the name of the nib file.
 
 @param tableView			The table view you wish to register the cell for.
 */
+ (void)yz_registerForTableView:(UITableView *)tableView;

/**
 Register a table view cell with the table view, using custom identifier and custom nib file name.
 
 @param tableView			The table view you wish to register the cell for.
 @param nibFileName			The name of the nib file, without any leading path information.
 @param reuseIdentifier		The reuse identifier for the specified cell. This parameter must not be `nil`.
 */
+ (void)yz_registerForTableView:(UITableView *)tableView
                withNibFileName:(NSString *)nibFileName
             andReuseIdentifier:(NSString *)reuseIdentifier;

/**
 Register a table view cell with the table view, using custom identifier and the class name (without package name) as the name of the nib file.
 
 @param tableView			The table view you wish to register the cell for.
 @param reuseIdentifier		The reuse identifier for the specified cell. This parameter must not be `nil`.
 */
+ (void)yz_registerForTableView:(UITableView *)tableView
            withReuseIdentifier:(NSString *)reuseIdentifier;

@end
