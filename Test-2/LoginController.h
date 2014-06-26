//
//  LoginController.h
//  Test-2
//
//  Created by Sachira Fernando on 6/26/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
{

    IBOutlet UITextField *PasswordText;
    IBOutlet UITextField *UsernameText;
    IBOutlet UIButton *SignInButton;
    IBOutlet UILabel *ErrorMsg;
    IBOutlet UIButton *SignUpButton;
}
- (IBAction)MoveToSignUp:(id)sender;
- (IBAction)SignInFunction:(id)sender;
@end
