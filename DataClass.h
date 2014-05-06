//
//  DataClass.h
//  Smile
//
//  Created by Christopher Dimick on 4/20/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface DataClass : NSObject{
    NSString *USERNAME;
}
@property(nonatomic, retain)NSString *USERNAME;
@property(nonatomic, retain)PFGeoPoint *LOCATION;
@property(nonatomic, retain)NSMutableArray  *USERPINGS;
+(DataClass*)getInstance;

@end
