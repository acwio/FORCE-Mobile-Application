//
//  Person.h
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;     //name of a person
    NSString *title;    //title in the company
    NSString *company;  //company person works for
    NSString *picURL;   //URL of person's picture
}
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *company;
@property(nonatomic,retain)NSString *picURL;

+(Person*)getInstance;
@end