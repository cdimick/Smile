//
//  PingViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "PingViewController.h"
#import "Ping.h"

@interface PingViewController ()

@end

@implementation PingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}



- (void)viewWillAppear:(BOOL)animated{
    /*
    DataClass *obj = [DataClass getInstance];
    PFQuery *query = [PFQuery queryWithClassName:@"Ping"];
    [query whereKey:@"targetUser" equalTo:obj.USERNAME];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSString *string = [NSString stringWithFormat:@"From: %@ Date and Time: %@", object[@"sentUser"], object[@"date"]];
                PFUser *currentUser = [PFUser currentUser];
                [currentUser addObject:string forKey:@"pings"];
                [currentUser saveInBackground];
                [object deleteInBackground];
            }
            [self.tableView reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
    }];
     */
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"View Did Load");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPing:(id)sender {
    
    DataClass *obj = [DataClass getInstance];
    // User's location
    PFGeoPoint *userGeoPoint = obj.LOCATION;
    // Create a query for places
    PFQuery *query = [PFUser query];
    // Interested in locations near user.
    [query whereKey:@"location" nearGeoPoint:userGeoPoint withinMiles:1000.0];
    [query whereKey:@"username" notEqualTo:obj.USERNAME];
    // Limit what could be a lot of points.
    query.limit = 3;
    // Final list of objects
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            for(PFObject *object in objects){
                PFUser *user = (PFUser *) object;
                PFObject *ping = [PFObject objectWithClassName:@"Ping"];
                ping[@"sentUser"] = obj.USERNAME;
                ping[@"targetUser"] = user[@"username"];
                ping[@"date"] = [NSDate date];
                [ping saveInBackground];
            }
        }
        else{
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    
    //[self.tableView reloadData];
}

#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataClass *obj = [DataClass getInstance];
    return [obj.USERPINGS count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        /*
        PFUser *currentUser = [PFUser currentUser];
        NSMutableArray *array = currentUser[@"pings"];
        if(indexPath.row < [array count]){
            cell.textLabel.text = (NSString *) [array objectAtIndex:indexPath.row];
        }
         */
    }
    DataClass *obj = [DataClass getInstance];
    PFObject *ping = [obj.USERPINGS objectAtIndex:indexPath.row];
    [cell.textLabel setText:ping[@"sentUser"]];
        NSLog(@"array: %@", obj.USERPINGS);
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
