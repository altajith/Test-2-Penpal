
//
//  DMViewController.h
//  Test-2
//
//  Created by Sachira Fernando on 6/24/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>
@interface DMViewController : UIViewController

{
    IBOutlet UIView *CicleView;
    IBOutlet UIView *MniCircle;
    IBOutlet UIImageView *ImageView;
    IBOutlet UIView *ShowPanelCenter;
    IBOutlet UIView *PannelTop;
    IBOutlet UIImageView *RightIcon;
    IBOutlet UIImageView *LeftIcon;
    IBOutlet UIImageView *TopIcon;
    IBOutlet UIImageView *BottonIcon;
    IBOutlet UIImageView *UserButton;
    
    IBOutlet UITextField *SearchText;
    
}
@property NSString *value1;
- (IBAction)MoveFromSeach:(id)sender;
- (IBAction)TouchToSearch:(id)sender;
@end
