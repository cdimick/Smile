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
    [self.fromLabel setText:[ping objectForKey:@"sentUser"]];
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
}

- (IBAction)reply:(id)sender {
}
@end
