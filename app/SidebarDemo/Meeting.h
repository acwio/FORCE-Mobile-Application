//
//  Meeting.h
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meeting : NSObject
{
    NSString *name;         //meeting name
    NSString *date;         //meeting date
    NSString *startTime;    //meeting end time
    NSString *endTime;      //meeting end time
    NSString *description;  //meeting description
    NSString *company;      //company holding meeting
    NSString *address;      //address of meeting
    NSString *city;         //city
    NSString *state;        //state
    NSString *zip;          //city
    
    //array of people to be added here for attending
    //array of files to be added here for files in the meeting
}
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *date;
@property(nonatomic,retain)NSString *startTime;
@property(nonatomic,retain)NSString *endTime;
@property(nonatomic,retain)NSString *description;
@property(nonatomic,retain)NSString *company;
@property(nonatomic,retain)NSString *city;
@property(nonatomic,retain)NSString *state;
@property(nonatomic,retain)NSString *zip;

+(Meeting*)getInstance;
@end
