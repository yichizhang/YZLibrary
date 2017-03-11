//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import "YZRandomNumbersViewController.h"

#import "YZRandom.h"

#import "YZSimpleTextCell.h"
#import "YZRandomControlCell.h"

#import "UIViewController+YZLibrary.h"
#import "UICollectionViewCell+YZLibrary.h"

#define K1 0.125
#define K2 0.21875
#define K3 0.046875

typedef enum
{
    YZViewControllerSectionRandomControl = 0,
    YZViewControllerSectionInfo,
    YZViewControllerSectionRandomNumbers,
    YZViewControllerSectionCount
} YZViewControllerSection;

typedef enum
{
    YZRandomGenerationOptionFloat = 0,
    YZRandomGenerationOptionInt,
    YZRandomGenerationOptionCount
} YZRandomGenerationOption;

@interface YZRandomNumbersViewController ()

@property(strong) NSMutableArray *dataArray;
@property(assign) YZRandomGenerationOption generationOption;
@property(assign) NSInteger dataCount;
@property(assign) float lowerBound;
@property(assign) float upperBound;

@property(assign) float minValue;
@property(assign) float maxValue;

@property(strong) NSTimer *updateTimer;

@property(assign) float timeOfLastUpdate;
@property(assign) float totalTime;

@end

@implementation YZRandomNumbersViewController

- (void)commonInit
{
    self.title = @"Random Numbers";
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];

    [self yz_ios7EdgeForExtendedLayout];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                        target:self
                                                      selector:@selector(timerMethod)
                                                      userInfo:nil
                                                       repeats:YES];
    [self.updateTimer fire];
}

- (void)viewDidLoad
{

    [super viewDidLoad];

    [YZSimpleTextCell yz_registerForCollectionView:self.collectionView];
    [YZRandomControlCell yz_registerForCollectionView:self.collectionView];

    self.dataArray = [NSMutableArray array];
    self.dataCount = 20;

    self.generationOption = 0;

    self.timeOfLastUpdate = -10;
    self.totalTime = 0;

    self.upperBound = 80;
    self.lowerBound = 20;

    self.minValue = -20;
    self.maxValue = 100;

    [self reloadContentAndRefreshData];


}

- (void)viewDidDisappear:(BOOL)animated
{

    [super viewDidDisappear:animated];

    [self.updateTimer invalidate];
    self.updateTimer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)timerMethod
{
    _totalTime += 0.1;
}

- (void)reloadContentAndRefreshData
{
    if (_totalTime - self.timeOfLastUpdate < 0.15) {
        return;
    }
    self.timeOfLastUpdate = _totalTime;

    [self.dataArray removeAllObjects];

    for (int i = 0; i < self.dataCount; i++) {
        if (self.generationOption == YZRandomGenerationOptionInt) {
            [self.dataArray
                    addObject:@([YZRandom intBetweenLower:self.lowerBound upper:self.upperBound])
            ];
        }
        else {
            [self.dataArray
                    addObject:@([YZRandom floatBetweenLower:self.lowerBound upper:self.upperBound])
            ];
        }
    }

    [UIView performWithoutAnimation:^{
        [self.collectionView reloadSections:[[NSIndexSet alloc] initWithIndexesInRange:
                NSMakeRange(YZViewControllerSectionInfo, YZViewControllerSectionRandomNumbers)]
        ];
    }];
}

- (void)generateButtonTapped:(id)sender
{
    [self reloadContentAndRefreshData];
}

- (void)segmentationControlValueUpdated:(id)sender
{
    UISegmentedControl *segControl = (UISegmentedControl *) sender;
    self.generationOption = (int) [segControl selectedSegmentIndex];

    [self reloadContentAndRefreshData];
}

- (void)upperBoundSliderValueUpdated:(id)sender
{
    UISlider *slider = (UISlider *) sender;
    self.upperBound = slider.value;

    [self reloadContentAndRefreshData];
}

- (void)lowerBoundSliderValueUpdated:(id)sender
{
    UISlider *slider = (UISlider *) sender;
    self.lowerBound = slider.value;

    [self reloadContentAndRefreshData];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    float top;
    float left;
    float bottom;
    float right;

    top = 0;
    left = 0;
    bottom = 0;
    right = 0;

    if (section == YZViewControllerSectionRandomNumbers) {
        top = 0;
        left = 0;
        bottom = 0;
        right = 0;
    }
    else if (section == YZViewControllerSectionRandomControl) {
    }
    else if (section == YZViewControllerSectionInfo) {
    }

    return UIEdgeInsetsMake(top, left, bottom, right);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    double screenWidth = [[UIScreen mainScreen] bounds].size.width;
    float w = 70.f;
    float h = 70.f;

    if (indexPath.section == YZViewControllerSectionRandomNumbers) {
        w = screenWidth * 0.2;
        h = screenWidth * 0.2;
    }
    else if (indexPath.section == YZViewControllerSectionRandomControl) {
        w = screenWidth;
        h = 82;
    }
    else if (indexPath.section == YZViewControllerSectionInfo) {
        w = screenWidth;
        h = screenWidth * 0.2;
    }

    return CGSizeMake(w, h);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return YZViewControllerSectionCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == YZViewControllerSectionRandomNumbers) {
        return self.dataCount;
    }
    else if (section == YZViewControllerSectionRandomControl) {
        return 1;
    }
    else if (section == YZViewControllerSectionInfo) {
        return 1;
    }

    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == YZViewControllerSectionRandomNumbers) {
        YZSimpleTextCell *cell = [YZSimpleTextCell yz_dequeueFromCollectionView:collectionView
                                                                   forIndexPath:indexPath];
        [cell setupCellWithData:nil];
        NSNumber *data = self.dataArray[indexPath.row];
        NSString *text;

        if (self.generationOption == YZRandomGenerationOptionInt) {
            text = [NSString stringWithFormat:@"%i", [data intValue]];
        }
        else {
            text = [NSString stringWithFormat:@"%.1f", [data floatValue]];
        }

        float percentage = (data.floatValue - self.minValue) / (self.maxValue - self.minValue);

        if (percentage < 0) {
            percentage = -percentage;
        }

        cell.backgroundColor =
                [UIColor colorWithHue:0.578
                           saturation:1.0
                           brightness:1.0 - 0.5 * percentage
                                alpha:1.0
                ];

        cell.mainLabel.text = text;
        cell.mainLabel.textColor = [UIColor whiteColor];

        return cell;
    }
    else if (indexPath.section == YZViewControllerSectionInfo) {
        YZSimpleTextCell *cell = [YZSimpleTextCell yz_dequeueFromCollectionView:collectionView
                                                                   forIndexPath:indexPath];
        [cell setupCellWithData:nil];
        NSString *text;

        if (self.generationOption == YZRandomGenerationOptionInt) {
            text = [NSString stringWithFormat:@"%i to %i",
                                              (int) self.lowerBound,
                                              (int) self.upperBound
            ];
        }
        else {
            text = [NSString stringWithFormat:@"%.1f to %.1f",
                                              self.lowerBound,
                                              self.upperBound
            ];
        }

        cell.mainLabel.text = text;
        cell.backgroundColor = [UIColor whiteColor];

        return cell;

    }
    else if (indexPath.section == YZViewControllerSectionRandomControl) {
        YZRandomControlCell *cell = [YZRandomControlCell yz_dequeueFromCollectionView:collectionView
                                                                         forIndexPath:indexPath];
        [cell setupCellWithData:nil];
        [cell.generateButton addTarget:self
                                action:@selector(generateButtonTapped:)
                      forControlEvents:UIControlEventTouchDown];
        [cell.segmentedControl addTarget:self
                                  action:@selector(segmentationControlValueUpdated:)
                        forControlEvents:UIControlEventValueChanged];
        [cell.lowerBoundSlider addTarget:self
                                  action:@selector(lowerBoundSliderValueUpdated:)
                        forControlEvents:UIControlEventValueChanged];

        cell.lowerBoundSlider.minimumValue = self.minValue;
        cell.lowerBoundSlider.maximumValue = self.maxValue;
        cell.lowerBoundSlider.value = self.lowerBound;

        [cell.upperBoundSlider addTarget:self
                                  action:@selector(upperBoundSliderValueUpdated:)
                        forControlEvents:UIControlEventValueChanged];

        cell.upperBoundSlider.minimumValue = self.minValue;
        cell.upperBoundSlider.maximumValue = self.maxValue;
        cell.upperBoundSlider.value = self.upperBound;

        return cell;

    }

    return nil;

}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == YZViewControllerSectionRandomNumbers) {
    }
    else if (indexPath.section == YZViewControllerSectionRandomControl) {
    }
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */


@end
