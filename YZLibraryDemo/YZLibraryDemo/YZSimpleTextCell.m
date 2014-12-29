/*
 
 Copyright (c) 2015 Scinece guy
 
 */

#import "YZSimpleTextCell.h"

@implementation YZSimpleTextCell
- (void)setupCellWithData:(id)data{
    
    self.mainLabel.textColor = [UIColor blackColor];
    self.mainLabel.font =  [UIFont boldSystemFontOfSize:16.0];
    self.mainLabel.text = data;
    
}

@end
