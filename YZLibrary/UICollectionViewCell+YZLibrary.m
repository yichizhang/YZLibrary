/*
 
 Copyright (c) 2014 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "UICollectionViewCell+YZLibrary.h"
#import "NSObject+YZLibrary.h"

@implementation UICollectionViewCell (YZLibrary)

+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView*)collectionView
                                forIndexPath:(NSIndexPath*)indexPath
{

    return
        [self yz_dequeueFromCollectionView:collectionView
                              forIndexPath:indexPath
                        andReuseIdentifier:[self yz_className]];
}

+ (instancetype)yz_dequeueFromCollectionView:(UICollectionView*)collectionView
                                forIndexPath:(NSIndexPath*)indexPath
                          andReuseIdentifier:(NSString*)reuseIdentifier
{

    return
        [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                  forIndexPath:indexPath];
}

+ (void)yz_registerForCollectionView:(UICollectionView*)collectionView
{
	NSString *defaultNibName = [self yz_className];
	NSString *defaultReuseId = [self yz_className];
	
	if([[NSBundle mainBundle] pathForResource:defaultNibName ofType:@"nib"] != nil)
	{
		
		[self yz_registerForCollectionView:collectionView
						   withNibFileName:defaultNibName
						andReuseIdentifier:defaultReuseId];
	}else{
		
		[self yz_registerForCollectionView:collectionView
					   withReuseIdentifier:defaultReuseId];
	}
	
}

+ (void)yz_registerForCollectionView:(UICollectionView*)collectionView
                     withNibFileName:(NSString*)nibFileName
                  andReuseIdentifier:(NSString*)reuseIdentifier
{

    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier];

    UINib* nib = [UINib nibWithNibName:nibFileName bundle:nil];
 
	[collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

+ (void)yz_registerForCollectionView:(UICollectionView*)collectionView
                 withReuseIdentifier:(NSString*)reuseIdentifier
{
	
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier];
}

@end
