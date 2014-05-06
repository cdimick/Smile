//
//  ProfileViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "ProfileViewController.h"
#import "Ping.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    DataClass *obj = [DataClass getInstance];
    obj.USERPINGS = currentUser[@"pings"];
    PFQuery *query = [PFQuery queryWithClassName:@"Ping"];
    [query whereKey:@"targetUser" equalTo:obj.USERNAME];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                //NSString *string = [NSString stringWithFormat:@"From: %@ Date and Time: %@", object[@"sentUser"], object[@"date"]];
                /*
                Ping *ping = [[Ping alloc] init];
                ping.date = object[@"date"];
                ping.sentUser = object[@"sentUser"];
                ping.targetUser = object[@"targetUser"];
                [obj.USERPINGS addObject:ping];
                 */
                NSLog(@"userPings: %@", obj.USERPINGS);
                PFObject *aPing = [PFObject objectWithClassName:@"Ping"];
                aPing[@"sentUser"] = object[@"sentUser"];
                aPing[@"targetUser"] = object[@"targetUser"];
                aPing[@"date"] = object[@"date"];
                [obj.USERPINGS addObject:aPing];
                PFUser *currentUser = [PFUser currentUser];
                [currentUser addObject:aPing forKey:@"pings"];
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

@end
