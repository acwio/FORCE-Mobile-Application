//
//  File.m
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "File.h"

@implementation File
@synthesize name;
@synthesize path;
static File *instance=nil;
+(File *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [File new];
        }
    }
    return instance;
}
@end
