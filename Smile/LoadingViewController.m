//
//  LoadingViewController.m
//  Smile
//
//  Created by Christopher Dimick on 5/9/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "LoadingViewController.h"
#import "Parse/Parse.h"
#import "DataClass.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(loadApp:) userInfo:nil repeats:NO];
    PFUser *currentUser = [PFUser currentUser];
    DataClass *obj = [DataClass getInstance];
    PFQuery *query = [PFQuery queryWithClassName:@"Cookies"];
    [query whereKey:@"targetUser" equalTo:obj.USERNAME];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                int currentPoints = [currentUser[@"karmaScore"] intValue];
                int addPoints = [object[@"points"] intValue];
                int total = currentPoints + addPoints;
                NSNumber *theTotal = [NSNumber numberWithInt:total];
                currentUser[@"karmaScore"] = theTotal;
                [currentUser saveInBackground];
                [object deleteInBackground];
            }
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadApp:(NSTimer *)pointer{
    [self performSegueWithIdentifier:@"loadApp" sender:nil];
}


@end
