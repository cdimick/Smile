//
//  PicsViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "PicsViewController.h"
#import "DataClass.h"

@interface PicsViewController ()

@end

@implementation PicsViewController

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
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(goBack:) userInfo:nil repeats:NO];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goBack:(NSTimer *)pointer{
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *photo = [obj.USERPHOTOS objectAtIndex:self.tableIndex];
    [obj.USERPHOTOS removeObjectAtIndex:self.tableIndex];
    PFUser *currentUser = [PFUser currentUser];
    [currentUser removeObject:photo forKey:@"photos"];
    [currentUser saveInBackground];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
