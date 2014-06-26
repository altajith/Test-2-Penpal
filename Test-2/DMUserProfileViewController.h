//
//  DMUserProfileViewController.h
//  Test-2
//
//  Created by Sachira Fernando on 6/24/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DMUserProfileViewController : UIViewController
{

    IBOutlet UILabel *ShowLabel;
    IBOutlet UIButton *LogoutButton;
    IBOutlet UIImageView *ProfilePic;
    IBOutlet UIButton *ChangeProfilePictureButton;
    NSString *value2;
    IBOutlet UIButton *DeactivateButton;
    IBOutlet UIView *DetialsContainer;
    IBOutlet UIButton *Next1;
    IBOutlet UILabel *UsernameDisplay;
    IBOutlet UITextField *NameText;
    IBOutlet UITextField *MobileText;
    IBOutlet UITextField *Address1Text;
    IBOutlet UITextField *Address2Text;
    IBOutlet UISegmentedControl *GenderSelector;
    IBOutlet UIButton *CompleteButton;
}

- (IBAction)LogoutFunction:(id)sender;
- (IBAction)ChangeProfilePicFunction:(id)sender;
- (IBAction)MoveNext1:(id)sender;
- (IBAction)CompleteAccountUpdate:(id)sender;

@end
