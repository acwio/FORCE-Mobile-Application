//
//  Meeting.h
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "File.h"

@interface Meeting : NSObject
{
    NSString *name;         //meeting name
    NSDate *date;         //meeting date
    NSString *description;  //meeting description
    NSString *company;      //company holding meeting
    NSString *address;      //address of meeting
    NSString *city;         //city
    NSString *state;        //state
    NSString *zip;          //zip
    
    NSMutableArray *people;
    NSMutableArray *files;
}
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSDate *date;
@property(nonatomic,retain)NSString *description;
@property(nonatomic,retain)NSString *company;
@property(nonatomic,retain)NSString *address;
@property(nonatomic,retain)NSString *city;
@property(nonatomic,retain)NSString *state;
@property(nonatomic,retain)NSString *zip;
@property(nonatomic,retain)NSMutableArray *people;
@property(nonatomic,retain)NSMutableArray *files;

+(Meeting*)getInstance;
@end
