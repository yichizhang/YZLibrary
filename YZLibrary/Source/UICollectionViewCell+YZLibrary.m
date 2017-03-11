//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "UICollectionViewCell+YZLibrary.h"
#import "NSObject+YZLibrary.h"

@implementation UICollectionViewCell (YZLibrary)

+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath
{

    return
            [self yz_dequeueFromCollectionView:collectionView
                                  forIndexPath:indexPath
                            andReuseIdentifier:[self yz_className]];
}

+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath
                          andReuseIdentifier:(NSString *)reuseIdentifier
{

    return
            [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                      forIndexPath:indexPath];
}

+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView
{
    NSString *defaultNibName = [self yz_className];
    NSString *defaultReuseId = [self yz_className];

    if ([[NSBundle mainBundle] pathForResource:defaultNibName ofType:@"nib"] != nil) {

        [self yz_registerForCollectionView:collectionView
                           withNibFileName:defaultNibName
                        andReuseIdentifier:defaultReuseId];
    }
    else {

        [self yz_registerForCollectionView:collectionView
                       withReuseIdentifier:defaultReuseId];
    }

}

+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView
                     withNibFileName:(NSString *)nibFileName
                  andReuseIdentifier:(NSString *)reuseIdentifier
{

    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier];

    UINib *nib = [UINib nibWithNibName:nibFileName bundle:nil];

    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

+ (void)yz_registerForCollectionView:(UICollectionView *)collectionView
                 withReuseIdentifier:(NSString *)reuseIdentifier
{

    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier];
}

@end
