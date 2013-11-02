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
            instance.meetings = [[NSMutableArray alloc] init];
            //add stub meetings
            [instance.meetings addObject:[self setName:@"TestMeeting" setDate:@"10/11/12" setSTime:@"4:00pm" setETime:@"5:00pm" setDesc:@"test meeting" setComp:@"NOM PEW LLC" setAddr:@"234 nom drive" setCity:@"nom" setStat:@"Nomtopia" setZip:@"1111111"]];
            
            [instance.meetings addObject:[self setName:@"Annual Sales Report" setDate:@"11/12/13" setSTime:@"4:00PM" setETime:@"4:30PM" setDesc:@"This is a meeting to discuss the annual sales." setComp:@"The Republic" setAddr:@"Space" setCity:@"Space City" setStat:@"Tatooine" setZip:@"1234567"]];
            
            [instance.meetings addObject:[self setName:@"Technology Report" setDate:@"1/2/3" setSTime:@"12:30PM" setETime:@"2:00PM" setDesc:@"Talk about the technological advances we are strivingto make" setComp:@"Death Star Inc" setAddr:@"1234 Death Star" setCity:@"Death Star" setStat:@"Space" setZip:@"54678"]];
            
            [instance.meetings addObject:[self setName:@"Interview" setDate:@"12/24/14" setSTime:@"2:00PM" setETime:@"3:00PM" setDesc:@"Interview for potential candidates who really want a job!" setComp:@"Scrooge LLC" setAddr:@"123 Bah Humbug Lane" setCity:@"New York" setStat:@"New York" setZip:@"12345"]];
            
            [instance.meetings addObject:[self setName:@"Business Meeting" setDate:@"11/31/2013" setSTime:@"1:00PM" setETime:@"2:00PM" setDesc:@"Meeting with a Potential Client" setComp:@"The Sales Company" setAddr:@"742 Cerulean Circuit" setCity:@"Indianapolis" setStat:@"Indiana" setZip:@"22506"]];
            
            [instance.meetings addObject:[self setName:@"Meglomaniacs Meeting" setDate:@"11/15/2013" setSTime:@"12:30PM" setETime:@"1:30PM" setDesc:@"A meeting of likeminded individuals who want to take over the world." setComp:@"The Truth Squad" setAddr:@"444 Truth Lane" setCity:@"Truth City" setStat:@"Tennessee" setZip:@"37128"]];
            
            [instance.meetings addObject:[self setName:@"Monthly Financial Report" setDate:@"11/5/2013" setSTime:@"2:45PM" setETime:@"3:45PM" setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223"]];
            
            
            
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