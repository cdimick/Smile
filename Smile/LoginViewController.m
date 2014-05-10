//
//  LoginViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/9/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.password.text = @"";
    self.label.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:255.0/255.0 green:165.0/255.0 blue:0.0/255.0 alpha:1.0];
    self.userName.delegate = self;
    self.password.delegate = self;
    self.userName.backgroundColor = [[UIColor alloc] initWithRed:253.0/255.0 green:198.0/255.0 blue:137.0/255.0 alpha:1.0];
    self.password.backgroundColor = [[UIColor alloc] initWithRed:253.0/255.0 green:198.0/255.0 blue:137.0/255.0 alpha:1.0];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * Logs the user in. Checks Parse if the username and password is in the database. If not, error is received.
 */
- (IBAction)login:(id)sender {
    [self.view endEditing:YES];
    [PFUser logInWithUsernameInBackground:self.userName.text password:self.password.text block:^(PFUser *user, NSError *error) {
        if (user) {
            // Do stuff after successful login.
            NSLog(@"Congrats you logged in dude");
            DataClass *obj = [DataClass getInstance];
            obj.USERNAME = self.userName.text;
            obj.LOCATION = user[@"location"];
            NSLog(@"latitdue:%f longitude:%f", obj.LOCATION.latitude, obj.LOCATION.longitude);
            [self performSegueWithIdentifier:@"loggingIn" sender:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
            [self.label setText:@"Invalid username/password"];
            self.label.textColor = [UIColor redColor];
            self.label.textAlignment = NSTextAlignmentCenter;
        }
    }];
}

/*
 * Simply redirects user to the Create New User View Controller
 */
- (IBAction)createUser:(id)sender {
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
