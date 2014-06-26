//
//  DMUserProfileViewController.m
//  Test-2
//
//  Created by Sachira Fernando on 6/24/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import "DMUserProfileViewController.h"
#import <Parse/Parse.h>
#include "LoginController.h"
@interface DMUserProfileViewController ()

@end

@implementation DMUserProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ShowLabel setText:value2];
    DeactivateButton.layer.cornerRadius=5;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LogoutFunction:(id)sender {
    [PFUser logOut];
    LoginController *userSignIn =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DMSignIn"];
    [self presentViewController:userSignIn animated:YES completion:nil];
}

- (IBAction)ChangeProfilePicFunction:(id)sender {
    NSLog(@" dd");
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)MoveNext1:(id)sender {
    NSLog(@"cool");

}

/*
- (void)selectPhotos
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    [picker delegate];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    //Deprecated In IOS6[self presentModalViewController:picker animated:YES];
    [picker release];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    ProfilePic.image = image;
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}*/

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    ProfilePic.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
