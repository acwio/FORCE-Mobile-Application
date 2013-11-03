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

+(File*)initWithName:(NSString *) name path: (NSString *) path
{
    File *f = [[File alloc] init];
    f.name = name;
    f.path = path;
    
    return f;
}

@end
