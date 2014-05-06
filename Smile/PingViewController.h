//
//  PingViewController.h
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataClass.h"

@interface PingViewController : UIViewController{
    NSMutableArray *userPings;
}

@property (weak, nonatomic) IBOutlet UIButton *ping;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)sendPing:(id)sender;

@end
