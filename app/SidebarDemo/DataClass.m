//
//  DataClass.m
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//
//

#import "DataClass.h"

//DataClass.m
@implementation DataClass
@synthesize meetings;
static DataClass *instance =nil;
+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [DataClass new];
        }
    }
    return instance;
}
@end