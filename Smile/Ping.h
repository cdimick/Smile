//
//  Ping.h
//  Smile
//
//  Created by Christopher Dimick on 5/6/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ping : NSObject{
    
}

@property(strong, nonatomic) NSDate *date;
@property(strong, nonatomic) NSString *sentUser;
@property(strong, nonatomic) NSString *targetUser;

@end
