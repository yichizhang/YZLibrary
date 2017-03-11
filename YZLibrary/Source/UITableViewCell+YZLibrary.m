//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UITableViewCell+YZLibrary.h"
#import "NSObject+YZLibrary.h"

@implementation UITableViewCell (YZLibrary)

+ (instancetype)yz_dequeueFromTableView:(UITableView *)tableView
                           forIndexPath:(NSIndexPath *)indexPath
{

    return
            [self yz_dequeueFromTableView:tableView
                             forIndexPath:indexPath
                       andReuseIdentifier:[self yz_className]];
}

+ (instancetype)yz_dequeueFromTableView:(UITableView *)tableView
                           forIndexPath:(NSIndexPath *)indexPath
                     andReuseIdentifier:(NSString *)reuseIdentifier
{

    return [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
}

+ (void)yz_registerForTableView:(UITableView *)tableView
{
    NSString *defaultNibName = [self yz_className];
    NSString *defaultReuseId = [self yz_className];

    if ([[NSBundle mainBundle] pathForResource:defaultNibName ofType:@"nib"] != nil) {

        [self yz_registerForTableView:tableView
                      withNibFileName:defaultNibName
                   andReuseIdentifier:defaultReuseId];
    }
    else {

        [self yz_registerForTableView:tableView
                  withReuseIdentifier:defaultReuseId];
    }
}

+ (void)yz_registerForTableView:(UITableView *)tableView
                withNibFileName:(NSString *)nibFileName
             andReuseIdentifier:(NSString *)reuseIdentifier
{

    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];

    UINib *nib = [UINib nibWithNibName:nibFileName bundle:nil];

    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

+ (void)yz_registerForTableView:(UITableView *)tableView
            withReuseIdentifier:(NSString *)reuseIdentifier
{

    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

@end
