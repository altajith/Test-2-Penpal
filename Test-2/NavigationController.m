//
//  NavigationController.m
//  Test-2
//
//  Created by Sachira Fernando on 6/26/14.
//  Copyright (c) 2014 Sachira Fernando. All rights reserved.
//

#import "NavigationController.h"
#import "Parse/PFUser.h"
#import "DMViewController.h"
#include "LoginController.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) {
        LoginController *userSignIn =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DMSignIn"];
        [self pushViewController:userSignIn animated:YES];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
