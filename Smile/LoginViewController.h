//
//  LoginViewController.h
//  Smile
//
//  Created by Christopher Dimick on 3/9/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DataClass.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *createUser;

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)login:(id)sender;
- (IBAction)createUser:(id)sender;

- (IBAction)backgroundTap:(id)sender;


@end
