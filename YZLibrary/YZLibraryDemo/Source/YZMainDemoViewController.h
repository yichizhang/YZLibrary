//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface YZMainDemoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(weak, nonatomic) IBOutlet UISlider *timeSlider;
@property(weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(weak, nonatomic) IBOutlet UIImageView *imageViewA;
@property(weak, nonatomic) IBOutlet UIImageView *imageViewB;
@property(weak, nonatomic) IBOutlet UIImageView *imageViewC;

@end
