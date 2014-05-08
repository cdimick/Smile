//
//  PicsViewController.h
//  Smile
//
//  Created by Christopher Dimick on 3/13/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@property (readwrite,assign) NSUInteger tableIndex;

@end
