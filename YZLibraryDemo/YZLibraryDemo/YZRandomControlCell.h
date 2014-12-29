/*
 
 Copyright (c) 2015 Scinece guy
 
 */

@import UIKit;

@interface YZRandomControlCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *lowerBoundSlider;
@property (weak, nonatomic) IBOutlet UISlider *upperBoundSlider;

- (void)setupCellWithData:(id)data;

@end
