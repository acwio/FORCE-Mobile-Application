//
//  Meeting.m
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "Meeting.h"

@implementation Meeting
@synthesize name;
@synthesize date;
@synthesize startTime;
@synthesize endTime;
@synthesize description;
@synthesize company;
@synthesize address;
@synthesize city;
@synthesize state;
@synthesize zip;
@synthesize people;
@synthesize files;
static Meeting *instance=nil;
+(Meeting *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [Meeting new];
        }
    }
    return instance;
}
@end
