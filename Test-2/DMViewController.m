//
//  DMViewController.m
//  Test-2
//
//  Created by Sachira Fernando on 6/24/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import "DMViewController.h"
#import "DMUserProfileViewController.h"
#import "Parse/PFUser.h"
@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad
{
    
     _value1 = @"this is string";
    //actually reference the singleton this
    
    [super viewDidLoad];
    
    //CicleView.alpha = 0.5;
   // CicleView.layer.cornerRadius = 131;   CicleView.backgroundColor = [UIColor blueColor];
    
    [self setRoundedView:CicleView toDiameter:275.0];
    [self setRoundedView:MniCircle toDiameter:235.0];
    [self setRoundedView:PannelTop toDiameter:90];
    
    ImageView.layer.cornerRadius = 117;
    ImageView.layer.masksToBounds = YES;
    
    
    
    ShowPanelCenter.layer.cornerRadius = 12;
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
    ImageView.userInteractionEnabled=YES;
    [ImageView addGestureRecognizer:tapImage];
    
    UITapGestureRecognizer *tapMiniCircle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(miniTapped:)];
    MniCircle.userInteractionEnabled=YES;
    [MniCircle addGestureRecognizer:tapMiniCircle];
    
    UITapGestureRecognizer *tapMiddleButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(middleButtonTapped:)];
    ShowPanelCenter.userInteractionEnabled=YES;
    [ShowPanelCenter addGestureRecognizer:tapMiddleButton];
    
    UITapGestureRecognizer *tapMailButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mailTapped:)];
    RightIcon.userInteractionEnabled=YES;
    [RightIcon addGestureRecognizer:tapMailButton];
    
    UITapGestureRecognizer *tapLevelButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(levelTapped:)];
    LeftIcon.userInteractionEnabled=YES;
    [LeftIcon addGestureRecognizer:tapLevelButton];
    
    UITapGestureRecognizer *tapFavButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(favTapped:)];
    TopIcon.userInteractionEnabled=YES;
    [TopIcon addGestureRecognizer:tapFavButton];
    
    UITapGestureRecognizer *tapRepButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reportTapped:)];
    BottonIcon.userInteractionEnabled=YES;
    [BottonIcon addGestureRecognizer:tapRepButton];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45, 96, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [PannelTop addSubview:lineView];
    
    UIView *lineVView = [[UIView alloc] initWithFrame:CGRectMake((PannelTop.bounds.size.width/2)+3, 0, 1, PannelTop.bounds.size.height+2)];
    lineVView.backgroundColor = [UIColor blackColor];
    [PannelTop addSubview:lineVView];
    
    UITapGestureRecognizer *tapUserButton = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userProfileTapped:)];
    UserButton.userInteractionEnabled=YES;
    [UserButton addGestureRecognizer:tapUserButton];
  

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRoundedView:(UIView *)roundedView toDiameter:(float)newSize;
{
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize / 2.0;
    roundedView.center = saveCenter;
}

- (void )middleButtonTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    if(PannelTop.alpha == 1){
        //HiddenPanelTop.hidden=NO;
        //HiddenPanelBottom.hidden=NO;
        //HiddenPanelLeft.hidden=NO;
        ///HiddenPanelRight.hidden=NO;
        
        [UIView animateWithDuration:1.0
                         animations:^{PannelTop.alpha = 0.0;}];
        
        
        /*[UIView animateWithDuration:1.0
                         animations:^{HiddenPanelBottom.alpha = 0.0;}];
        
        
        [UIView animateWithDuration:1.0
                         animations:^{HiddenPanelLeft.alpha = 0.0;}];
        
        
        [UIView animateWithDuration:1.0
                         animations:^{HiddenPanelRight.alpha = 0.0;}];*/
        
    }else{
        //HiddenPanelTop.hidden=YES;
       // HiddenPanelBottom.hidden=YES;
        //HiddenPanelLeft.hidden=YES;
       // HiddenPanelRight.hidden=YES;
        
        
        [UIView animateWithDuration:1.0
                         animations:^{PannelTop.alpha = 1;}];
        
        /*
        [UIView animateWithDuration:1.0
                         animations:^{HiddenPanelBottom.alpha = 1;}];
        
        
        [UIView animateWithDuration:1.0
                         animations:^{HiddenPanelLeft.alpha = 1;}];
        
        
        [UIView animateWithDuration:1.0
                         animations:^{HiddenPanelRight.alpha = 1;}];*/
    }
}

- (void )imageTapped:(UITapGestureRecognizer *) gestureRecognizer
{
   
    //ImageView.hidden=YES;
    [UIImageView animateWithDuration:1.0
                     animations:^{
                         ImageView.alpha = 0.0;
                         CicleView.backgroundColor=[UIColor colorWithRed:(160/255.0) green:(97/255.0) blue:(5/255.0) alpha:1.0];
                     }];
}

- (void )miniTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    
    //ImageView.hidden=NO;
    
    [UIImageView animateWithDuration:1.0
                          animations:^{
                              ImageView.alpha = 1;
                              CicleView.backgroundColor=[UIColor whiteColor];
                          }];
}

- (void )mailTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    
    if(RightIcon.highlighted == NO){
        RightIcon.highlighted=YES;
        PannelTop.backgroundColor = [UIColor blueColor];
    }else{
        RightIcon.highlighted=NO;
        PannelTop.backgroundColor = [UIColor whiteColor];
    }
    
    LeftIcon.highlighted=NO;
    BottonIcon.highlighted=NO;
    TopIcon.highlighted=NO;
}

- (void )levelTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    
    if(LeftIcon.highlighted == NO){
        LeftIcon.highlighted=YES;
        PannelTop.backgroundColor = [UIColor greenColor];
    }else{
        LeftIcon.highlighted=NO;
        PannelTop.backgroundColor = [UIColor whiteColor];
    }
    
    RightIcon.highlighted=NO;
    BottonIcon.highlighted=NO;
    TopIcon.highlighted=NO;
}

- (void )reportTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    
    if(BottonIcon.highlighted == NO){
        BottonIcon.highlighted=YES;
        PannelTop.backgroundColor = [UIColor redColor];
    }else{
        BottonIcon.highlighted=NO;
        PannelTop.backgroundColor = [UIColor whiteColor];
    }
    
    RightIcon.highlighted=NO;
    LeftIcon.highlighted=NO;
    TopIcon.highlighted=NO;
}

- (void )favTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    
    if(TopIcon.highlighted == NO){
        /*[UIImageView animateWithDuration:1.0
                              animations:^{
                                  
                              }];*/
        TopIcon.highlighted=YES;
        PannelTop.backgroundColor = [UIColor yellowColor];
    }else{
        TopIcon.highlighted=NO;
        PannelTop.backgroundColor = [UIColor whiteColor];
    }
    
    RightIcon.highlighted=NO;
    LeftIcon.highlighted=NO;
    BottonIcon.highlighted=NO;
    
   // NSLog(@"sdddd");
}

- (void )userProfileTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    PFObject *testObject = [PFObject objectWithClassName:@"Users"];
    testObject[@"username"] = @"bar";
    [testObject saveInBackground];
    /*
    DMUserProfileViewController *secondViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DMUserProfileID"];
    secondViewController.value2=_value1;
    
    [self presentViewController:secondViewController animated:YES completion:nil];*/
}


- (IBAction)MoveFromSeach:(id)sender {
    [UIImageView animateWithDuration:1.0
                          animations:^{
                              [SearchText setFrame:CGRectMake(0,20,77,30)];
                          }];
}

- (IBAction)TouchToSearch:(id)sender {
    [UIImageView animateWithDuration:1.0
                          animations:^{
                              [SearchText setFrame:CGRectMake(0,20,320,30)];
                          }];
    /*
    NSString *test=@"bar";
    
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"username" equalTo:test];
    //[query orderByDescending:@"score"];
    //query.limit = 5;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *rateObjects, NSError *error)
     {
         if( !error )
         {
             NSMutableArray *data = [[NSMutableArray alloc]init];
             [data addObjectsFromArray:rateObjects];
             NSArray *rating_data = [data valueForKey:@"objectId"];
             NSLog(@"%@",[rating_data objectAtIndex:0]);
             
         }
     }
     ];*/
    
    [self myMethod];
    
}

//Sign Up
- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSLog(@"Error");
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

//Upload Image
/*
 // Convert to JPEG with 50% quality
 NSData* data = UIImageJPEGRepresentation(ImageView.image, 0.5f);
 PFFile *imageFile = [PFFile fileWithName:@"IronManWallpaper.jpg" data:data];
 
 // Save the image to Parse
 
 [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 if (!error) {
 // The image has now been uploaded to Parse. Associate it with a new object
 PFObject* newPhotoObject = [PFObject objectWithClassName:@"PhotoObject"];
 [newPhotoObject setObject:imageFile forKey:@"image"];
 
 [newPhotoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 if (!error) {
 NSLog(@"Saved");
 }
 else{
 // Error
 NSLog(@"Error: %@ %@", error, [error userInfo]);
 }
 }];
 }
 }];

 */

@end
