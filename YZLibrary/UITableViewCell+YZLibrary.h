//
//  UITableViewCell+YZLibrary.h
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

@interface UITableViewCell (YZLibrary)

/** Dequeue a table view cell, using default identifier, which is identical to the class name (without package name) of the cell.
 */
+ (instancetype)yz_dequeueFromTableView:(UITableView*)tableView
                           forIndexPath:(NSIndexPath*)indexPath;

/** Dequeue a table view cell, using custom identifier.
 */
+ (instancetype)yz_dequeueFromTableView:(UITableView*)tableView
                           forIndexPath:(NSIndexPath*)indexPath
                     andReuseIdentifier:(NSString*)reuseIdentifier;

/** Register a table view cell with the table view, using the class name (without package name) as the identifier and the name of the nib file.
 */
+ (void)yz_registerForTableView:(UITableView*)tableView;

/** Register a table view cell with the table view, using custom identifier and custom nib file name.
 */
+ (void)yz_registerForTableView:(UITableView*)tableView
                withNibFileName:(NSString*)nibFileName
             andReuseIdentifier:(NSString*)reuseIdentifier;

/** Register a table view cell with the table view, using custom identifier and the class name (without package name) as the name of the nib file.
 */
+ (void)yz_registerForTableView:(UITableView*)tableView
            withReuseIdentifier:(NSString*)reuseIdentifier;

@end
