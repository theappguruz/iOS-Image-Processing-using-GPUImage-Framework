//
//  ViewController.m
//  GPUDemo
//
//  Created by TheAppGuruz-New-6 on 28/03/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnStartCameraClicked:(id)sender
{
    
}

- (IBAction)btnProcessImageClicked:(id)sender
{
    ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:ipc animated:YES completion:nil];
    ipc = nil;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *inputImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    image_p=[[GPUImagePicture alloc]initWithImage:inputImage];

    GPUImageSketchFilter *filter1=[[GPUImageSketchFilter alloc]init];
    [image_p addTarget:filter1];
    [image_p processImage];
    
    UIImageWriteToSavedPhotosAlbum([filter1 imageFromCurrentlyProcessedOutput], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    if (!error)
    {
        alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Your image successfully saved to gallary.you can check it in gallary." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    }
    else
    {
        alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Your iamge has not been saved." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    }
    [alert show];
}

@end
