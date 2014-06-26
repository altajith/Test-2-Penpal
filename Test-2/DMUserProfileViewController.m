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
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSString *userText = [NSString stringWithFormat: @"Hi %@,", currentUser.username];
        [UsernameDisplay setText:userText];
    }
    
    PFQuery *query= [PFUser query];
    
    [query whereKey:@"username" equalTo:currentUser.username];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *object, NSError *error){
        if(!error)
        {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            [data addObjectsFromArray:object];
            NSArray *mobile = [data valueForKey:@"mobile"];
            NSArray *fullname = [data valueForKey:@"fullname"];
            NSArray *address1 = [data valueForKey:@"address1"];
            NSArray *address2 = [data valueForKey:@"address2"];
            NSArray *gender = [data valueForKey:@"gender"];
            NSArray *image = [data valueForKey:@"image"];
            
            @try {
                MobileText.text=[mobile objectAtIndex:0];
                NameText.text=[fullname objectAtIndex:0];
                
                PFFile *file = [image objectAtIndex:0];
                
                [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:data];
                        ProfilePic.image=image;
                    }
                }];
                
                Address1Text.text=[address1 objectAtIndex:0];
                Address2Text.text=[address2 objectAtIndex:0];
                
                if([[gender objectAtIndex:0] isEqualToString:@"Male"]){
                    [GenderSelector setSelectedSegmentIndex:0];
                }else if([[gender objectAtIndex:0] isEqualToString:@"Female"]){
                    [GenderSelector setSelectedSegmentIndex:1];
                }
                
                
            }@catch (NSException *e) {
            }
            @finally{
                MobileText.placeholder=@"Complete your profile.";
                NameText.placeholder=@"Complete your profile.";
                Address1Text.placeholder=@"Complete your profile.";
                Address2Text.placeholder=@"Complete your profile.";
            }
        }
        
    }];
    

    
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
    PFQuery *query= [PFUser query];
    [query whereKey:@"username" equalTo:[PFUser currentUser].username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * userStats, NSError *error) {
        if (!error) {
            // Found UserStats
            [userStats setObject:MobileText.text forKey:@"mobile"];
            [userStats setObject:NameText.text forKey:@"fullname"];
            
            
            NSData* data = UIImageJPEGRepresentation(ProfilePic.image, 0.5f);
            PFFile *imageFile = [PFFile fileWithName:@"UserProfile.jpg" data:data];
            
            [userStats setObject:imageFile forKey:@"image"];
            
            
            // Save
            [userStats saveInBackground];
        } else {
            // Did not find any UserStats for the current user
            NSLog(@"Error: %@", error);
        }
    }];

}

- (IBAction)CompleteAccountUpdate:(id)sender {
    PFQuery *query= [PFUser query];
    [query whereKey:@"username" equalTo:[PFUser currentUser].username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * userStats, NSError *error) {
        if (!error) {
            // Found UserStats
            [userStats setObject:Address1Text.text forKey:@"address1"];
            [userStats setObject:Address2Text.text forKey:@"address2"];
            
            NSString *gender=[GenderSelector titleForSegmentAtIndex:GenderSelector.selectedSegmentIndex];
            [userStats setObject:gender forKey:@"gender"];
            
            // Save
            [userStats saveInBackground];
        } else {
            // Did not find any UserStats for the current user
            NSLog(@"Error: %@", error);
        }
    }];
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
