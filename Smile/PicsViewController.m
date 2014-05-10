//
//  PicsViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "PicsViewController.h"
#import "DataClass.h"
#import "RatingsViewController.h"

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
    self.navigationItem.hidesBackButton = YES;
    [[self navigationController] setNavigationBarHidden:YES];
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *photo = [obj.USERPHOTOS objectAtIndex:self.tableIndex];
    NSString *sentUser = [photo objectForKey:@"sentUser"];
    UIImage *image;
    if([sentUser isEqualToString:@"cdimick"]){
        image = [UIImage imageNamed:@"cdimick.jpg"];
    }
    else if([sentUser isEqualToString:@"sbanerjee"] || [sentUser isEqualToString:@"sbanerjee1"]){
        image = [UIImage imageNamed:@"suman.jpg"];
    }
    else if([sentUser isEqualToString:@"msanders"] || [sentUser isEqualToString:@"msanders1"]){
        image = [UIImage imageNamed:@"msanders.jpg"];
    }
    else if([sentUser isEqualToString:@"cmorgan"]){
        image = [UIImage imageNamed:@"cmorgan.jpg"];
    }
    else{
        image = [UIImage imageNamed:@"nicolascage.jpg"];
    }
    [self.imageView setImage:image];
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
    NSString *sentUser = [photo objectForKey:@"sentUser"];
    [obj.USERPHOTOS removeObjectAtIndex:self.tableIndex];
    PFUser *currentUser = [PFUser currentUser];
    [currentUser removeObject:photo forKey:@"photos"];
    [currentUser saveInBackground];
    //[self.navigationController popViewControllerAnimated:YES];
    RatingsViewController *ratingsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RatingsViewController"];
    ratingsVC.targetUser = sentUser;
    [self.navigationController pushViewController:ratingsVC animated:YES];
}

@end
