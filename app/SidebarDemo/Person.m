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

+(Person*)initWithName:(NSString *) name title:(NSString *) title company:(NSString *) company picture: (NSString *) picture
{
    Person *p = [[Person alloc] init];
    p.name = name;
    p.title = title;
    p.company = company;
    p.picURL = picture;
    
    return p;
}

@end
