//
//  PicMeUpViewController.m
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "PicMeUpViewController.h"
#import "PicsViewController.h"

@interface PicMeUpViewController ()

@end

@implementation PicMeUpViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataClass *obj = [DataClass getInstance];
    return [obj.USERPHOTOS count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    DataClass *obj = [DataClass getInstance];
    NSMutableDictionary *photo = [obj.USERPHOTOS objectAtIndex:indexPath.row];
    NSString *string = [NSString stringWithFormat:@"From: %@", [photo objectForKey:@"sentUser"]];
    NSString *dateString = [NSString stringWithFormat:@"%@", [photo objectForKey:@"date"]];
    [cell.textLabel setText:string];
    [cell.detailTextLabel setText:dateString];
    NSLog(@"array: %@", obj.USERPHOTOS);
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PicsViewController *picsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PicsViewController"];
    picsVC.tableIndex = indexPath.row;
    [self.navigationController pushViewController:picsVC animated:YES];
    
}

@end
