//
//  RatingsViewController.m
//  Smile
//
//  Created by Christopher Dimick on 5/9/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "RatingsViewController.h"
#import "Parse/Parse.h"
#import "HomeViewController.h"

@interface RatingsViewController ()

@end

@implementation RatingsViewController

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
    self.navigationItem.hidesBackButton = YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)negone:(id)sender {
    NSNumber *value = @-1;
    [self createCookieWithValue:value];
}

- (IBAction)zero:(id)sender {
    NSNumber *value = @0;
    [self createCookieWithValue:value];
}

- (IBAction)one:(id)sender {
    NSNumber *value = @1;
    [self createCookieWithValue:value];
}

- (IBAction)two:(id)sender {
    NSNumber *value = @2;
    [self createCookieWithValue:value];
}

- (IBAction)three:(id)sender {
    NSNumber *value = @3;
    [self createCookieWithValue:value];
}

- (IBAction)four:(id)sender {
    NSNumber *value = @4;
    [self createCookieWithValue:value];
}

- (void)createCookieWithValue:(NSNumber *)value{
    PFObject *cookie = [PFObject objectWithClassName:@"Cookie"];
    cookie[@"targetUser"] = self.targetUser;
    cookie[@"points"] = value;
    [cookie saveInBackground];
    NSMutableArray *allViewControllers = [NSMutableArray arrayWithArray:[self.navigationController viewControllers]];
    for(UIViewController *aViewController in allViewControllers){
        if([aViewController isKindOfClass:[HomeViewController class]]){
            [self.navigationController popToViewController:aViewController animated:YES];
        }
    }
    
}

@end
