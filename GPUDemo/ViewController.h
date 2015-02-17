//
//  ViewController.h
//  GPUDemo
//
//  Created by TheAppGuruz-New-6 on 28/03/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *ipc;
    GPUImageStillCamera *stillCamera;
    GPUImageToonFilter *customFilter;
    GPUImageView *image;
    GPUImagePicture *image_p;

}
- (IBAction)btnStartCameraClicked:(id)sender;
- (IBAction)btnProcessImageClicked:(id)sender;


@end
