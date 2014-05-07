//
//  ResponseViewController.h
//  Smile
//
//  Created by Christopher Dimick on 5/7/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResponseViewController : UIViewController

@property (readwrite,assign) NSUInteger tableIndex;
@property (weak, nonatomic) IBOutlet UIButton *ignore;
@property (weak, nonatomic) IBOutlet UIButton *reply;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


- (IBAction)ignore:(id)sender;
- (IBAction)reply:(id)sender;


@end
