//
//  DMSignUpController.h
//  Test-2
//
//  Created by Sachira Fernando on 6/25/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMSignUpController : UIViewController
{
    IBOutlet UIButton *SignUpButton;
    IBOutlet UITextField *UsernameText;
    IBOutlet UITextField *EmailText;
    IBOutlet UITextField *PasswordText;
    IBOutlet UITextField *ConfrimPassword;
    IBOutlet UILabel *ErrorMsg;
    IBOutlet UIButton *BackButton;
    IBOutlet UIProgressView *PasswordStrengthBar;
    
}
- (IBAction)SignUpFunction:(id)sender;
- (IBAction)ChangePasswordStrength:(id)sender;

@end
