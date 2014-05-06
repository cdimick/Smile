//
//  DataClass.m
//  Smile
//
//  Created by Christopher Dimick on 4/20/14.
//  Copyright (c) 2014 Christopher Dimick. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass
@synthesize USERNAME;
static DataClass *instance =nil;
+(DataClass *)getInstance{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance = [DataClass new];
        }
    }
    return instance;
}

@end
