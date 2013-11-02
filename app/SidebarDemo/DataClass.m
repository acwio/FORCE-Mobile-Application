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
static Meeting *meet = nil;
+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance=[DataClass new];
            //[self setName:@"TestMeeting" setDate:@"10/11/12" setSTime:@"4:00pm" setETime:@"5:00pm" setDesc:@"test meeting" setComp:@"NOM PEW LLC" setAddr:@"234 nom drive" setCity:@"nom" setStat:@"Nomtopia" setZip:@"1111111"];
            
            
        }
    }
    return instance;
}
+(Meeting *) setName: (NSString *) name
        setDate: (NSString *) date
        setSTime:(NSString *) startTime
        setETime:(NSString *) endTime
        setDesc: (NSString *) description
        setComp: (NSString *) company
        setAddr: (NSString *) address
        setCity: (NSString *) city
        setStat: (NSString *) state
        setZip : (NSString *) zip;
{
    meet = [Meeting new];
    meet.name = name;
    meet.date = date;
    meet.startTime = startTime;
    meet.endTime = endTime;
    meet.description = description;
    meet.company = company;
    meet.address = address;
    meet.city = city;
    meet.state = state;
    meet.zip = zip;
    meet.people = nil;
    meet.files = nil;
    
    return meet;
    
    //add meet to meetings
    //[meetings.add meet]
}
@end

/*
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
*/