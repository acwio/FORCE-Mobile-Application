//
//  DataClass.m
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//
//

#import "DataClass.h"

@implementation DataClass

@synthesize meetings;
@synthesize people;
@synthesize files;

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
            instance.people = [[NSMutableArray alloc] init];
            instance.files = [[NSMutableArray alloc] init];
            
            //set up date stuff
            NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
            
            //set up all people
            [instance.people addObject:[Person initWithName:@"Magic Karp" title:@"Splash" company:@"Poke E Monn" picture:@"user.png"]];
            [instance.people addObject:[Person initWithName:@"Gyra Dos" title:@"Dragon-like" company:@"Poke E Monn" picture:@"calendar_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Dragon Ite" title:@"More Dragon-like" company:@"Poke E Monn" picture:@"bookmark_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ampha Ros" title:@"Who?" company:@"Poke E Monn" picture:@"comments_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Squirtle Squad" title:@"Worst Pokemon ever" company:@"Poke E Monn" picture:@"tag_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pika Chu" title:@"Pika Pika" company:@"Poke E Monn" picture:@"wishlist_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ry Don" title:@"The Boss" company:@"Poke E Monn" picture:@"calendar_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Chari Zard" title:@"The BE(a)ST" company:@"Poke E Monn" picture:@"bookmark_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Blast Oise" title:@"Okay, I guess" company:@"Poke E Monn" picture:@"comments_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Venus Aur" title:@"Terrible" company:@"Poke E Monn" picture:@"tag_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cle Fable" title:@"Cle-who?" company:@"Poke E Monn" picture:@"wishlist_photo.jpg"]];
            
            //set up all files
            [instance.files addObject:[File initWithName:@"Expense Report" path:@"force.pdf"]];
            [instance.files addObject:[File initWithName:@"Meeting Docket" path:@"Person.txt"]];
            [instance.files addObject:[File initWithName:@"Epic Notes" path:@"user.png"]];
            [instance.files addObject:[File initWithName:@"Future Endeavors" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"New Technology" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"White Board Picture" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"Cat Picture" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"AR Demo" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"Recording of Tech Meeting" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"What did the fox say" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"Other Expense Report" path:@"calendar_photo.jpg"]];
            
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
            
            //set up date
            dateComponents.year = 2012;
            dateComponents.month = 10;
            dateComponents.day = 11;
            dateComponents.hour = 10;
            NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            //assign a meeting
            [instance.meetings addObject:[self setName:@"TestMeeting" setDate:date setDesc:@"test meeting" setComp:@"NOM PEW LLC" setAddr:@"234 nom drive" setCity:@"nom" setStat:@"Nomtopia" setZip:@"1111111" setPeople:mPeople setFiles:mFiles]];
            //empty mPeople and mFiles
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            
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
            
            //set up date
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 12;
            dateComponents.hour = 10;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Annual Sales Report" setDate:date setDesc:@"This is a meeting to discuss the annual sales." setComp:@"The Republic" setAddr:@"Space" setCity:@"Space City" setStat:@"Tatooine" setZip:@"1234567" setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
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
            
            dateComponents.year = 2003;
            dateComponents.month = 02;
            dateComponents.day = 01;
            dateComponents.hour = 6;
            dateComponents.minute = 30;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Technology Report" setDate:date setDesc:@"Talk about the technological advances we are strivingto make" setComp:@"Death Star Inc" setAddr:@"1234 Death Star" setCity:@"Death Star" setStat:@"Space" setZip:@"54678"setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
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
            
            dateComponents.year = 2014;
            dateComponents.month = 12;
            dateComponents.day = 24;
            dateComponents.hour = 8;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Interview" setDate:date setDesc:@"Interview for potential candidates who really want a job!" setComp:@"Scrooge LLC" setAddr:@"123 Bah Humbug Lane" setCity:@"New York" setStat:@"New York" setZip:@"12345" setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            //meeting 5
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:10]];
            [mPeople addObject:[instance.people objectAtIndex:4]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:6]];
            
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 31;
            dateComponents.hour = 7;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Business Meeting" setDate:date setDesc:@"Meeting with a Potential Client" setComp:@"The Sales Company" setAddr:@"742 Cerulean Circuit" setCity:@"Indianapolis" setStat:@"Indiana" setZip:@"22506" setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
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
            
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 15;
            dateComponents.hour = 6;
            dateComponents.minute = 30;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Meglomaniacs Meeting" setDate:date setDesc:@"A meeting of likeminded individuals who want to take over the world." setComp:@"The Truth Squad" setAddr:@"444 Truth Lane" setCity:@"Truth City" setStat:@"Tennessee" setZip:@"37128" setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
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
            
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Monthly Financial Report" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
        }
    }
    return instance;
}
+(Meeting *) setName: (NSString *) name
        setDate: (NSDate *) date
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
    meet.description = description;
    meet.company = company;
    meet.address = address;
    meet.city = city;
    meet.state = state;
    meet.zip = zip;
    meet.people = [people copy];
    meet.files = [files copy];
    
    return meet;
}

@end

