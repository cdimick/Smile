//
//  RatingsViewController.h
//  Smile
//
//  Created by Christopher Dimick on 5/9/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *negone;
@property (weak, nonatomic) IBOutlet UIButton *zero;
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;

@property (strong, nonatomic) NSString *targetUser;




- (IBAction)negone:(id)sender;
- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;

- (void)createCookieWithValue:(NSNumber *)value;

@end
