/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "UIView+YZLibrary.h"
#import "NSObject+YZLibrary.h"

@implementation UIView (YZLibrary)

+ (instancetype)yz_loadFromNib{
	
	return [[self class] yz_loadFromNibNamed:[self yz_className] bundle:nil];
	
}

+ (instancetype)yz_loadFromNibNamed:(NSString*)nibName bundle:(NSBundle*)bundle{
	
	static UINib * __nib;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__nib = [UINib nibWithNibName:nibName bundle:bundle];
	});
	
	id view = [__nib instantiateWithOwner:nil options:nil][0];
	return view;
}

- (void)yz_bringToFront {
	[[self superview] bringSubviewToFront:self];
}

- (UIImage*)yz_captureImage{
	
	return [self yz_captureImageWithScaleFactor:
			[UIScreen mainScreen].scale
			];
}

- (UIImage*)yz_captureImageWithScaleFactor:(CGFloat)scaleFactor{
	
	UIGraphicsBeginImageContextWithOptions(self.bounds.size,
										   NO,
										   scaleFactor
										   );
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UICollectionViewCell *)yz_parentCollectionViewCell
{
    id viewSuperView = [self superview];
    while (viewSuperView != nil) {
        if ([viewSuperView isKindOfClass:[UICollectionViewCell class]]) {
            return (UICollectionViewCell *)viewSuperView;
        }
        else {
            viewSuperView = [viewSuperView superview];
        }
    }
    return nil;
}

- (UITableViewCell *)yz_parentTableViewCell
{
    id viewSuperView = [self superview];
    while (viewSuperView != nil) {
        if ([viewSuperView isKindOfClass:[UITableViewCell class]]) {
            return (UITableViewCell *)viewSuperView;
        }
        else {
            viewSuperView = [viewSuperView superview];
        }
    }
    return nil;
}

- (void)yz_addShadow{
    
    UIBezierPath *shadowPath =
    [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}

- (void)yz_addWhiteFrame{

    [self.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [self.layer setBorderWidth: 5.0];
}

- (void)yz_preloadKeyboard{
	
	UITextField *tempTextField = [[UITextField alloc] init];
	[self addSubview:tempTextField];
	[tempTextField becomeFirstResponder];
	[tempTextField resignFirstResponder];
	[tempTextField removeFromSuperview];
}

@end
