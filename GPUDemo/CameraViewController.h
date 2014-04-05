//
//  CameraViewController.h
//  GPUDemo
//
//  Created by TheAppGuruz-New-6 on 28/03/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface CameraViewController : UIViewController
{
    GPUImageStillCamera *stillCamera;
    GPUImageFilter *filter;
    GPUImageView *image;
}
- (IBAction)btnCaptureClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCapture;

@end
