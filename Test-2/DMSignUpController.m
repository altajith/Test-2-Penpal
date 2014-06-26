//
//  DMSignUpController.m
//  Test-2
//
//  Created by Sachira Fernando on 6/25/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import "DMSignUpController.h"
#import "Parse/PFUser.h"
#import "LoginController.h"
@interface DMSignUpController ()

@end

@implementation DMSignUpController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SignUpButton.layer.cornerRadius=5;
    BackButton.layer.cornerRadius=5;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignUpFunction:(id)sender
{
    //UserController *user = [[UserController alloc] init];
    BOOL validated=[self validateSignUp];
    if(validated == 1){
        PFUser *user = [PFUser user];
        user.username = UsernameText.text;
        user.password = PasswordText.text;
        user.email = EmailText.text;
        // other fields can be set just like with PFObject
        user[@"fullname"] = @"";
        user[@"mobile"] = @"";
        user[@"address1"] = @"";
        user[@"address2"] = @"";
        user[@"gender"] = @"";
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                ErrorMsg.textColor=[UIColor whiteColor];
                ErrorMsg.text=@"You are successfully registered.";
                UsernameText.text=@"";
                EmailText.text=@"";
                PasswordText.text=@"";
                ConfrimPassword.text=@"";
                
            } else {
                NSString *errorString = [error userInfo][@"error"];
                errorString = [errorString stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[errorString substringToIndex:1] uppercaseString]];
                
                ErrorMsg.textColor=[UIColor redColor];
                ErrorMsg.text=errorString;
                
            }
        }];
    }
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
    
    if ([EmailText.text isEqualToString:@""]){
        
        [EmailText becomeFirstResponder];
        EmailText.text=@"";
        EmailText.placeholder=@"Email field is empty.";
        EmailText.layer.borderWidth = 1;
        EmailText.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }
    else{
        EmailText.layer.borderWidth = 0;
        EmailText.layer.borderColor=[[UIColor blackColor] CGColor];
        [EmailText resignFirstResponder];
    }
    
    if (![self NSStringIsValidEmail:(NSString *)EmailText.text]){
        
        [EmailText becomeFirstResponder];
        EmailText.text=@"";
        EmailText.placeholder=@"Email is not valid.";
        EmailText.layer.borderWidth = 1;
        EmailText.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }
    else{
        EmailText.layer.borderWidth = 0;
        EmailText.layer.borderColor=[[UIColor blackColor] CGColor];
        [EmailText resignFirstResponder];
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
    
    if ([ConfrimPassword.text isEqualToString:@""]){
        
        [ConfrimPassword becomeFirstResponder];
        ConfrimPassword.text=@"";
        ConfrimPassword.placeholder=@"Confirm Password field is empty.";
        ConfrimPassword.layer.borderWidth = 1;
        ConfrimPassword.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }else{
        ConfrimPassword.layer.borderWidth = 0;
        ConfrimPassword.layer.borderColor=[[UIColor blackColor] CGColor];
        [ConfrimPassword resignFirstResponder];
    }
    
    if (![ConfrimPassword.text isEqualToString:PasswordText.text]){
        
        [ConfrimPassword becomeFirstResponder];
        ConfrimPassword.text=@"";
        ConfrimPassword.placeholder=@"Password fields are not matched.";
        ConfrimPassword.layer.borderWidth = 1;
        ConfrimPassword.layer.borderColor=[[UIColor redColor] CGColor];
        
        return FALSE;
    }else{
        ConfrimPassword.layer.borderWidth = 0;
        ConfrimPassword.layer.borderColor=[[UIColor blackColor] CGColor];
        [ConfrimPassword resignFirstResponder];
    }
    [PasswordStrengthBar setProgress:0.0];
    return TRUE;
}

- (BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL) NSStringIsContainsNumber:(NSString *)checkString
{
    NSString *stricterFilterString = @"^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)ChangePasswordStrength:(id)sender {
    if(PasswordText.text.length < 4){
        PasswordStrengthBar.tintColor=[UIColor redColor];
        [PasswordStrengthBar setProgress:0.25];
        //ErrorMsg.text=@"Too Week";
        
    }else if(PasswordText.text.length < 8){
        PasswordStrengthBar.tintColor=[UIColor yellowColor];
        [PasswordStrengthBar setProgress:0.5];
        //ErrorMsg.text=@"Good";
        
    }else if(PasswordText.text.length > 8){
        PasswordStrengthBar.tintColor=[UIColor greenColor];
        [PasswordStrengthBar setProgress:1.0];
        //ErrorMsg.text=@"Perfect";
    }
}

- (IBAction)MoveBack:(id)sender {
    LoginController *userSignIn =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DMSignIn"];
    
    [self presentViewController:userSignIn animated:YES completion:nil];

}

@end
