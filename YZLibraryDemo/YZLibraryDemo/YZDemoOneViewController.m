/*
 
 Copyright (c) 2015 Scinece guy
 
 */

#import "YZDemoOneViewController.h"

#import "UIImage+YZLibrary.h"
#import "NSDictionary+YZLibrary.h"
#import "YZTimeHelper.h"

@interface YZDemoOneViewController ()

@end

@implementation YZDemoOneViewController

- (void)commonInit{
    
    self.title = @"Demo";
    self.tabBarItem =
    [[UITabBarItem alloc]
	 initWithTitle:self.title
	 image:[YZLibraryDemoStyleKit imageOfOne]
     tag:0
     ];
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateTimeInfo];
    
    
    NSMutableDictionary *dict1 = [@{@"Key1": @"Val1"} mutableCopy];
    NSMutableDictionary *dict2 = [dict1 yz_dictionaryWithAdditionalEntriesFromDictionary:@{@"Key2": @"Val2"}];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.imageViewA.image = chosenImage;
    self.imageViewB.image = [chosenImage yz_imageScaledToSize:CGSizeMake(90, 90)];
    self.imageViewC.image = [chosenImage yz_imageScaledToSize:CGSizeMake(40, 40)];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)pickImageButtonTapped:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)timeSliderUpdated:(id)sender {
    
    [self updateTimeInfo];
    
}

- (void)updateTimeInfo{
    
    self.timeLabel.text =
    [NSString
     stringWithFormat:@"%.1fs\n%@",
     self.timeSlider.value,
     [YZTimeHelper hmsTimeStringFromSecondsFloat:self.timeSlider.value]
     ];
    
}

@end
