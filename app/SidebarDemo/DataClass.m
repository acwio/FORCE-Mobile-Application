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
@synthesize people;
@synthesize files;

static DataClass *instance =nil;
static Meeting *meet = nil;
static Person *person = nil;
static File *file = nil;
+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance=[DataClass new];
            instance.meetings = [[NSMutableArray alloc] init];
            instance.people = [[NSMutableArray alloc] init];
            instance.files = [[NSMutableArray alloc] init];
            
            //set up all people
            [instance.people addObject:[self setName:@"Magic Karp" setPath:@"mkarp.jpg"]];
            [instance.people addObject:[self setName:@"Gyra Dos" setPath:@"gDos.jpg"]];
            [instance.people addObject:[self setName:@"Dragon Ite" setPath:@"dIte.jpg"]];
            [instance.people addObject:[self setName:@"Ampha Ros" setPath:@"aRos.jpg"]];
            [instance.people addObject:[self setName:@"Squirtle Squad" setPath:@"sSquad.jpg"]];
            [instance.people addObject:[self setName:@"Pika Chu" setPath:@"pChu.jpg"]];
            [instance.people addObject:[self setName:@"Ry Don" setPath:@"rDon.jpg"]];
            [instance.people addObject:[self setName:@"Chari Zard" setPath:@"cZard.jpg"]];
            [instance.people addObject:[self setName:@"Blast Oise" setPath:@"bOise.jpg"]];
            [instance.people addObject:[self setName:@"Venus Aur" setPath:@"vAur.jpg"]];
            [instance.people addObject:[self setName:@"Cle Fable" setPath:@"cFable.jpg"]];
            
            //set up all files
            [instance.files addObject:[self setName:@"Expense Report" setPath:@"file1.pdf"]];
            [instance.files addObject:[self setName:@"Meeting Docket" setPath:@"file2.doc"]];
            [instance.files addObject:[self setName:@"Epic Notes" setPath:@"file3.rtf"]];
            [instance.files addObject:[self setName:@"Future Endeavors" setPath:@"file4.pdf"]];
            [instance.files addObject:[self setName:@"New Technology" setPath:@"file5.pdf"]];
            [instance.files addObject:[self setName:@"White Board Picture" setPath:@"file6.png"]];
            [instance.files addObject:[self setName:@"Cat Picture" setPath:@"file7.jpg"]];
            [instance.files addObject:[self setName:@"AR Demo" setPath:@"file8.mov"]];
            [instance.files addObject:[self setName:@"Recording of Tech Meeting" setPath:@"file9.ogg"]];
            [instance.files addObject:[self setName:@"What did the fox say" setPath:@"file10.avi"]];
            [instance.files addObject:[self setName:@"Other Expense Report" setPath:@"file11.pdf"]];
            
            /* Set up Meeting
                Step1: Assign People Attending Meeting
                Step2: Assign files, if any to Meeting
                Step3: Add Meeting object with correct parameters
            */
            
            //initialize meeting people and files variables
            NSMutableArray *mPeople = [[NSMutableArray alloc] init];
            NSMutableArray *mFiles = [[NSMutableArray alloc] init];
            
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:0]];
            [mPeople addObject:[instance.people objectAtIndex:2]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            [mPeople addObject:[instance.people objectAtIndex:5]];
            [mPeople addObject:[instance.people objectAtIndex:6]];
            [mPeople addObject:[instance.people objectAtIndex:8]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:0]];
            [mFiles addObject:[instance.files objectAtIndex:1]];
            //assign a meeting
            [instance.meetings addObject:[self setName:@"TestMeeting" setDate:@"10/11/12" setSTime:@"4:00pm" setETime:@"5:00pm" setDesc:@"test meeting" setComp:@"NOM PEW LLC" setAddr:@"234 nom drive" setCity:@"nom" setStat:@"Nomtopia" setZip:@"1111111" setPeople:mPeople setFiles:mFiles]];
            //empty mPeople and mFiles
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            
            //meeting 2
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:9]];
            [mPeople addObject:[instance.people objectAtIndex:8]];
            [mPeople addObject:[instance.people objectAtIndex:2]];
            [mPeople addObject:[instance.people objectAtIndex:3]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:9]];
            [mFiles addObject:[instance.files objectAtIndex:3]];
            [mFiles addObject:[instance.files objectAtIndex:7]];
            [instance.meetings addObject:[self setName:@"Annual Sales Report" setDate:@"11/12/13" setSTime:@"4:00PM" setETime:@"4:30PM" setDesc:@"This is a meeting to discuss the annual sales." setComp:@"The Republic" setAddr:@"Space" setCity:@"Space City" setStat:@"Tatooine" setZip:@"1234567" setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            //meeting 3
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:0]];
            [mPeople addObject:[instance.people objectAtIndex:2]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            [mPeople addObject:[instance.people objectAtIndex:5]];
            [mPeople addObject:[instance.people objectAtIndex:6]];
            [mPeople addObject:[instance.people objectAtIndex:8]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:0]];
            [mFiles addObject:[instance.files objectAtIndex:1]];
            [instance.meetings addObject:[self setName:@"Technology Report" setDate:@"1/2/3" setSTime:@"12:30PM" setETime:@"2:00PM" setDesc:@"Talk about the technological advances we are strivingto make" setComp:@"Death Star Inc" setAddr:@"1234 Death Star" setCity:@"Death Star" setStat:@"Space" setZip:@"54678"setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            //meeting 4
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:0]];
            [mPeople addObject:[instance.people objectAtIndex:1]];
            [mPeople addObject:[instance.people objectAtIndex:2]];
            [mPeople addObject:[instance.people objectAtIndex:3]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            [mPeople addObject:[instance.people objectAtIndex:5]];
            [mPeople addObject:[instance.people objectAtIndex:6]];
            [mPeople addObject:[instance.people objectAtIndex:7]];
            [mPeople addObject:[instance.people objectAtIndex:8]];
            [mPeople addObject:[instance.people objectAtIndex:9]];
            [mPeople addObject:[instance.people objectAtIndex:10]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:0]];
            [mFiles addObject:[instance.files objectAtIndex:1]];
            [mFiles addObject:[instance.files objectAtIndex:2]];
            [mFiles addObject:[instance.files objectAtIndex:3]];
            [mFiles addObject:[instance.files objectAtIndex:4]];
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:6]];
            [mFiles addObject:[instance.files objectAtIndex:7]];
            [mFiles addObject:[instance.files objectAtIndex:8]];
            [mFiles addObject:[instance.files objectAtIndex:9]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            [instance.meetings addObject:[self setName:@"Interview" setDate:@"12/24/14" setSTime:@"2:00PM" setETime:@"3:00PM" setDesc:@"Interview for potential candidates who really want a job!" setComp:@"Scrooge LLC" setAddr:@"123 Bah Humbug Lane" setCity:@"New York" setStat:@"New York" setZip:@"12345" setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            //meeting 5
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:10]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:6]];
            [instance.meetings addObject:[self setName:@"Business Meeting" setDate:@"11/31/2013" setSTime:@"1:00PM" setETime:@"2:00PM" setDesc:@"Meeting with a Potential Client" setComp:@"The Sales Company" setAddr:@"742 Cerulean Circuit" setCity:@"Indianapolis" setStat:@"Indiana" setZip:@"22506" setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            //meeting 6
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:0]];
            [mPeople addObject:[instance.people objectAtIndex:1]];
            [mPeople addObject:[instance.people objectAtIndex:2]];
            [mPeople addObject:[instance.people objectAtIndex:3]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:4]];
            [mFiles addObject:[instance.files objectAtIndex:3]];
            [instance.meetings addObject:[self setName:@"Meglomaniacs Meeting" setDate:@"11/15/2013" setSTime:@"12:30PM" setETime:@"1:30PM" setDesc:@"A meeting of likeminded individuals who want to take over the world." setComp:@"The Truth Squad" setAddr:@"444 Truth Lane" setCity:@"Truth City" setStat:@"Tennessee" setZip:@"37128" setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
            
            //meeting 7
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:0]];
            [mPeople addObject:[instance.people objectAtIndex:1]];
            [mPeople addObject:[instance.people objectAtIndex:7]];
            [mPeople addObject:[instance.people objectAtIndex:5]];
            [mPeople addObject:[instance.people objectAtIndex:3]];
            [mPeople addObject:[instance.people objectAtIndex:10]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            [instance.meetings addObject:[self setName:@"Monthly Financial Report" setDate:@"11/5/2013" setSTime:@"2:45PM" setETime:@"3:45PM" setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setPeople:mPeople setFiles:mFiles]];
            mPeople.removeAllObjects;
            mFiles.removeAllObjects;
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
        setZip : (NSString *) zip
        setPeople:(NSMutableArray *)people
        setFiles:(NSMutableArray *)files;
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
}

+(Person *) setName:(NSString *)name
           setTitle:(NSString *)title
          setCompany:(NSString *)company
          setPicURL:(NSString *)picURL
{
    person = [Person new];
    person.name = name;
    person.title = title;
    person.company = company;
    person.picURL = picURL;
    
    return person;
}

+(File *) setName:(NSString *)name
          setPath:(NSString *)path
{
    file = [File new];
    file.name = name;
    file.path = path;
    
    return file;
}
@end

