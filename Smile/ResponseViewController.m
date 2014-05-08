//
//  ResponseViewController.m
//  Smile
//
//  Created by Christopher Dimick on 5/7/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "ResponseViewController.h"
#import "DataClass.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController

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
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *ping = [obj.USERPINGS objectAtIndex:self.tableIndex];
    NSString *fromString = [NSString stringWithFormat:@"From: %@", [ping objectForKey:@"sentUser"]];
    [self.fromLabel setText:fromString];
    NSString *dateString = [NSString stringWithFormat:(@"%@"), [ping objectForKey:@"date"]];
    [self.dateLabel setText:dateString];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ignore:(id)sender {
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *ping = [obj.USERPINGS objectAtIndex:self.tableIndex];
    [obj.USERPINGS removeObjectAtIndex:self.tableIndex];
    PFUser *currentUser = [PFUser currentUser];
    [currentUser removeObject:ping forKey:@"pings"];
    [currentUser saveInBackground];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)reply:(id)sender {
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *ping = [obj.USERPINGS objectAtIndex:self.tableIndex];
    [obj.USERPINGS removeObjectAtIndex:self.tableIndex];
    PFUser *currentUser = [PFUser currentUser];
    [currentUser removeObject:ping forKey:@"pings"];
    [currentUser saveInBackground];
    PFObject *photo = [PFObject objectWithClassName:@"Photo"];
    photo[@"sentUser"] = ping[@"targetUser"];
    photo[@"targetUser"] = ping[@"sentUser"];
    photo[@"date"] = [NSDate date];
    [photo saveInBackground];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
