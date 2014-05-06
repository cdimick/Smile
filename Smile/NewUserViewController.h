//
//  NewUserViewController.h
//  Smile
//
//  Created by Christopher Dimick on 4/20/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUserViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)submit:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
