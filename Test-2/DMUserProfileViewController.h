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
}

- (IBAction)LogoutFunction:(id)sender;
- (IBAction)ChangeProfilePicFunction:(id)sender;
- (IBAction)MoveNext1:(id)sender;

@end
