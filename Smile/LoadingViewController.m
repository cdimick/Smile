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
    self.view.backgroundColor = [[UIColor alloc] initWithRed:255.0/255.0 green:165.0/255.0 blue:0.0/255.0 alpha:1.0];
    int r = arc4random() % 5;
    self.message.lineBreakMode = NSLineBreakByWordWrapping;
    self.message.numberOfLines = 0;
    if(r == 0){
        [self.message setText:@"Let your smile change the world, don't let the world change your smile!"];
    }
    else if(r == 1){
        [self.message setText:@"All people smile in the same language."];
    }
    else if(r == 2){
        [self.message setText:@"It's easier to smile than it is to frown!"];
    }
    else if(r == 3){
        [self.message setText:@"Fact: Those who smile live longer."];;
    }
    else{
        [self.message setText:@"If you see a friend without a smile, give them one of yours!"];;
    }
    self.navigationItem.hidesBackButton = YES;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(loadApp:) userInfo:nil repeats:NO];
    PFUser *currentUser = [PFUser currentUser];
    DataClass *obj = [DataClass getInstance];
    PFQuery *query = [PFQuery queryWithClassName:@"Cookie"];
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
