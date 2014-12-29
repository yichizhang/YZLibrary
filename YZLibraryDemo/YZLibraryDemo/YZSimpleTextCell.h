/*
 
 Copyright (c) 2015 Scinece guy
 
 */

#import <UIKit/UIKit.h>

@interface YZSimpleTextCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

- (void)setupCellWithData:(id)data;

@end
