//
//  NewUserViewController.m
//  Smile
//
//  Created by Christopher Dimick on 4/20/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "NewUserViewController.h"
#import <Parse/Parse.h>
#import "DataClass.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController

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
    self.userName.delegate = self;
    self.password.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.userName.text;
    user.password = self.password.text;
    PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:40.1 longitude:-32.0];
    user[@"location"] = point;
    user[@"karmaScore"] = @0;
    user[@"pings"] = [[NSMutableArray alloc] init];
    user[@"photos"] = [[NSMutableArray alloc] init];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            NSLog(@"You're logged in!");
            DataClass *obj = [DataClass getInstance];
            obj.USERNAME = user[@"username"];
            obj.LOCATION = user[@"location"];
            NSLog(@"latitdue:%f longitude:%f", obj.LOCATION.latitude, obj.LOCATION.longitude);
            [self performSegueWithIdentifier:@"createNew" sender:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
            [self.label setText:@"Username already taken"];
            self.label.textColor = [UIColor redColor];
            self.label.textAlignment = NSTextAlignmentCenter;
        }
    }];
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
