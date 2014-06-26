//
//  LoginController.m
//  Test-2
//
//  Created by Sachira Fernando on 6/26/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import "LoginController.h"
#import "Parse/PFUser.h"
#import "DMViewController.h"
#import "DMSignUpController.h"
@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    SignInButton.layer.cornerRadius=5;
    SignUpButton.layer.cornerRadius=5;
    self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"d ajith");
    // Dispose of any resources that can be recreated.
}


- (BOOL)validateSignUp
{
    if ([UsernameText.text isEqualToString:@""]){
        
        [UsernameText becomeFirstResponder];
        UsernameText.text=@"";
        UsernameText.placeholder=@"Username field is empty.";
        UsernameText.layer.borderWidth = 1;
        UsernameText.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }else{
        UsernameText.layer.borderWidth = 0;
        UsernameText.layer.borderColor=[[UIColor blackColor] CGColor];
        [UsernameText resignFirstResponder];
    }
    
    if ([PasswordText.text isEqualToString:@""]){
        
        [PasswordText becomeFirstResponder];
        PasswordText.text=@"";
        PasswordText.placeholder=@"Password field is empty.";
        PasswordText.layer.borderWidth = 1;
        PasswordText.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }else{
        PasswordText.layer.borderWidth = 0;
        PasswordText.layer.borderColor=[[UIColor blackColor] CGColor];
        [PasswordText resignFirstResponder];
    }
    
    return TRUE;
}

- (IBAction)MoveToSignUp:(id)sender {
    DMSignUpController *userSignUp =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DMSignUp"];
    
    [self presentViewController:userSignUp animated:YES completion:nil];
}

- (IBAction)SignInFunction:(id)sender {
    if([self validateSignUp] == 1){
        [PFUser logInWithUsernameInBackground:UsernameText.text password:PasswordText.text
            block:^(PFUser *user, NSError *error) {
            if (user) {
                
                DMViewController *userHome =
                [self.storyboard instantiateViewControllerWithIdentifier:@"DMViewId"];
                
                [self presentViewController:userHome animated:YES completion:nil];
                
            } else {
                NSString *errorString = [error userInfo][@"error"];
                 errorString = [errorString stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[errorString substringToIndex:1] uppercaseString]];
                
                ErrorMsg.textColor=[UIColor redColor];
                ErrorMsg.text=errorString;
            }
        }];
        
    }
}
@end
