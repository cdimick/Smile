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
                NSLog(@"userPings: %@", obj.USERPINGS);
                NSMutableDictionary *aPing = [[NSMutableDictionary alloc]init];
                [aPing setValue:object[@"sentUser"] forKey:@"sentUser"];
                [aPing setValue:object[@"targetUser"] forKey:@"targetUser"];
                [aPing setValue:object[@"date"] forKey:@"date"];
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
    obj.USERPHOTOS = currentUser[@"photos"];
    PFQuery *photoQuery = [PFQuery queryWithClassName:@"Photo"];
    [photoQuery whereKey:@"targetUser" equalTo:obj.USERNAME];
    [photoQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"userPhotos: %@", obj.USERPHOTOS);
                NSMutableDictionary *aPhoto = [[NSMutableDictionary alloc]init];
                [aPhoto setValue:object[@"sentUser"] forKey:@"sentUser"];
                [aPhoto setValue:object[@"targetUser"] forKey:@"targetUser"];
                [aPhoto setValue:object[@"date"] forKey:@"date"];
                [obj.USERPHOTOS addObject:aPhoto];
                PFUser *currentUser = [PFUser currentUser];
                [currentUser addObject:aPhoto forKey:@"photos"];
                [currentUser saveInBackground];
                [object deleteInBackground];
            }
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
