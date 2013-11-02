//
//  Person.m
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name;
@synthesize title;
@synthesize company;
@synthesize picURL;
static Person *instance=nil;
+(Person *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [Person new];
        }
    }
    return instance;
}
@end
