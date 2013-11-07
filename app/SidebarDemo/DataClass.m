//
//  DataClass.m
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//
//

#import <CoreLocation/CoreLocation.h>
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
            
            CLLocation *location = [[CLLocation alloc] initWithLatitude:35.8492 longitude:-86.3686]; //85113 longitude:-86.369167];
            
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
            
            [instance.people addObject:[Person initWithName:@"Mark Hamilton" title:@"Director of Sales" company:@"Magic Industries" picture:@"men1.jpg"]];
            [instance.people addObject:[Person initWithName:@"Donald White" title:@"Director of Sales" company:@"Magic Industries" picture:@"men2.jpg"]];
            [instance.people addObject:[Person initWithName:@"Owen Thomas" title:@"Director of Sales" company:@"Magic Industries" picture:@"men3.jpg"]];
            [instance.people addObject:[Person initWithName:@"Stephen Thompson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men4.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angel Griffen" title:@"Director of Sales" company:@"Magic Industries" picture:@"men5.jpg"]];
            [instance.people addObject:[Person initWithName:@"Aiden Howard" title:@"Director of Sales" company:@"Magic Industries" picture:@"men6.jpg"]];
            [instance.people addObject:[Person initWithName:@"George Bell" title:@"Director of Sales" company:@"Magic Industries" picture:@"men7.jpg"]];
            [instance.people addObject:[Person initWithName:@"Evan Watson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men8.jpg"]];
            [instance.people addObject:[Person initWithName:@"Abraham	 Davidson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men9.jpg"]];
            [instance.people addObject:[Person initWithName:@"Josh Manning" title:@"Director of Sales" company:@"Magic Industries" picture:@"men10.jpg"]];
            [instance.people addObject:[Person initWithName:@"Loren Ford" title:@"Director of Sales" company:@"Magic Industries" picture:@"men11.jpg"]];
            [instance.people addObject:[Person initWithName:@"Shane Stone" title:@"Director of Sales" company:@"Magic Industries" picture:@"men12.jpg"]];
            [instance.people addObject:[Person initWithName:@"Zachary Gibbs" title:@"Director of Sales" company:@"Magic Industries" picture:@"men13.jpg"]];
            [instance.people addObject:[Person initWithName:@"Brandon	 Mckinney" title:@"Director of Sales" company:@"Magic Industries" picture:@"men14.jpg"]];
            [instance.people addObject:[Person initWithName:@"Orlando	 Williamson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men15.jpg"]];
            [instance.people addObject:[Person initWithName:@"Jorge Curry" title:@"Director of Sales" company:@"Magic Industries" picture:@"men16.jpg"]];
            [instance.people addObject:[Person initWithName:@"Andrew Tran" title:@"Director of Sales" company:@"Magic Industries" picture:@"men17.jpg"]];
            [instance.people addObject:[Person initWithName:@"Owen Lynch" title:@"Director of Sales" company:@"Magic Industries" picture:@"men18.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lyle Soto" title:@"Director of Sales" company:@"Magic Industries" picture:@"men19.jpg"]];
            [instance.people addObject:[Person initWithName:@"Herbert Walker" title:@"Director of Sales" company:@"Magic Industries" picture:@"men20.jpg"]];
            [instance.people addObject:[Person initWithName:@"Samuel Wilkins" title:@"Director of Sales" company:@"Magic Industries" picture:@"men21.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elias Higgins" title:@"Director of Sales" company:@"Magic Industries" picture:@"men22.jpg"]];
            [instance.people addObject:[Person initWithName:@"Miguel Craid" title:@"Director of Sales" company:@"Magic Industries" picture:@"men23.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cesar Medina" title:@"Director of Sales" company:@"Magic Industries" picture:@"men24.jpg"]];
            [instance.people addObject:[Person initWithName:@"Seth Torres" title:@"Director of Sales" company:@"Magic Industries" picture:@"men25.jpg"]];
            [instance.people addObject:[Person initWithName:@"Michael Moss" title:@"Director of Sales" company:@"Magic Industries" picture:@"men26.jpg"]];
            [instance.people addObject:[Person initWithName:@"Levi Andrews" title:@"Director of Sales" company:@"Magic Industries" picture:@"men27.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cameron Cortez" title:@"Director of Sales" company:@"Magic Industries" picture:@"men28.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rodney Rios" title:@"Director of Sales" company:@"Magic Industries" picture:@"men29.jpg"]];
            [instance.people addObject:[Person initWithName:@"Eugene Pena" title:@"Director of Sales" company:@"Magic Industries" picture:@"men30.jpg"]];
            [instance.people addObject:[Person initWithName:@"Tyler Sanders" title:@"Director of Sales" company:@"Magic Industries" picture:@"men31.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kyle Carson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men32.jpg"]];
            [instance.people addObject:[Person initWithName:@"Brendan Bridges" title:@"Director of Sales" company:@"Magic Industries" picture:@"men33.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angelo Ray" title:@"Director of Sales" company:@"Magic Industries" picture:@"men34.jpg"]];
            [instance.people addObject:[Person initWithName:@"Robert Wong" title:@"Director of Sales" company:@"Magic Industries" picture:@"men35.jpg"]];
            [instance.people addObject:[Person initWithName:@"Bert Ortega" title:@"Director of Sales" company:@"Magic Industries" picture:@"men36.jpg"]];
            [instance.people addObject:[Person initWithName:@"Scott Norman" title:@"Director of Sales" company:@"Magic Industries" picture:@"men37.jpg"]];
            [instance.people addObject:[Person initWithName:@"Fernando Duncan" title:@"Director of Sales" company:@"Magic Industries" picture:@"men38.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ray Lindsay" title:@"Director of Sales" company:@"Magic Industries" picture:@"men39.jpg"]];
            [instance.people addObject:[Person initWithName:@"Abel Pratt" title:@"Director of Sales" company:@"Magic Industries" picture:@"men40.jpg"]];
            [instance.people addObject:[Person initWithName:@"Mario Ramos" title:@"Director of Sales" company:@"Magic Industries" picture:@"men41.jpg"]];
            [instance.people addObject:[Person initWithName:@"Thomas Bishop" title:@"Director of Sales" company:@"Magic Industries" picture:@"men42.jpg"]];
            [instance.people addObject:[Person initWithName:@"Courtney Stewart" title:@"Director of Sales" company:@"Magic Industries" picture:@"men43.jpg"]];
            [instance.people addObject:[Person initWithName:@"Victor Thompson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men44.jpg"]];
            [instance.people addObject:[Person initWithName:@"Myron Green" title:@"Director of Sales" company:@"Magic Industries" picture:@"men45.jpg"]];
            [instance.people addObject:[Person initWithName:@"Dewey Gilbert" title:@"Director of Sales" company:@"Magic Industries" picture:@"men46.jpg"]];
            [instance.people addObject:[Person initWithName:@"Mike Fuller" title:@"Director of Sales" company:@"Magic Industries" picture:@"men47.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kelly Lawson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men48.jpg"]];
            [instance.people addObject:[Person initWithName:@"Terrance Dawson" title:@"Director of Sales" company:@"Magic Industries" picture:@"men49.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lynn Weber" title:@"Director of Sales" company:@"Magic Industries" picture:@"men50.jpg"]];
 
            
            [instance.people addObject:[Person initWithName:@"Ernestine Todd" title:@"Director of Sales" company:@"Magic Industries" picture:@"women1.jpg"]];
            [instance.people addObject:[Person initWithName:@"Janie Young" title:@"Director of Sales" company:@"Magic Industries" picture:@"women2.jpg"]];
            [instance.people addObject:[Person initWithName:@"Sophie Carson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women3.jpg"]];
            [instance.people addObject:[Person initWithName:@"Maxine Poole" title:@"Director of Sales" company:@"Magic Industries" picture:@"women4.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rebecca Hardy" title:@"Director of Sales" company:@"Magic Industries" picture:@"women5.jpg"]];
            [instance.people addObject:[Person initWithName:@"Johnnie Palmer" title:@"Director of Sales" company:@"Magic Industries" picture:@"women6.jpg"]];
            [instance.people addObject:[Person initWithName:@"Beatrice Turner" title:@"Director of Sales" company:@"Magic Industries" picture:@"women7.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angie Gibson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women8.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lucia White" title:@"Director of Sales" company:@"Magic Industries" picture:@"women9.jpg"]];
            [instance.people addObject:[Person initWithName:@"Sonna Wright" title:@"Director of Sales" company:@"Magic Industries" picture:@"women10.jpg"]];
            [instance.people addObject:[Person initWithName:@"Eloise Cross" title:@"Director of Sales" company:@"Magic Industries" picture:@"women11.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kelli Martinez" title:@"Director of Sales" company:@"Magic Industries" picture:@"women12.jpg"]];
            [instance.people addObject:[Person initWithName:@"Velma Hamilton" title:@"Director of Sales" company:@"Magic Industries" picture:@"women13.jpg"]];
            [instance.people addObject:[Person initWithName:@"Nicole Aguilar" title:@"Director of Sales" company:@"Magic Industries" picture:@"women14.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elsa Goodwin" title:@"Director of Sales" company:@"Magic Industries" picture:@"women15.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lynda Fuller" title:@"Director of Sales" company:@"Magic Industries" picture:@"women16.jpg"]];
            [instance.people addObject:[Person initWithName:@"Yvette Pratt" title:@"Director of Sales" company:@"Magic Industries" picture:@"women17.jpg"]];
            [instance.people addObject:[Person initWithName:@"Teresa Murphy" title:@"Director of Sales" company:@"Magic Industries" picture:@"women18.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kristi Cortez" title:@"Director of Sales" company:@"Magic Industries" picture:@"women19.jpg"]];
            [instance.people addObject:[Person initWithName:@"Krista Ryan" title:@"Director of Sales" company:@"Magic Industries" picture:@"women20.jpg"]];
            [instance.people addObject:[Person initWithName:@"Leona Warner" title:@"Director of Sales" company:@"Magic Industries" picture:@"women21.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elisa Mcdaniel" title:@"Director of Sales" company:@"Magic Industries" picture:@"women22.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cristina Mccarthy" title:@"Director of Sales" company:@"Magic Industries" picture:@"women23.jpg"]];
            [instance.people addObject:[Person initWithName:@"Jaime Gregory" title:@"Director of Sales" company:@"Magic Industries" picture:@"women24.jpg"]];
            [instance.people addObject:[Person initWithName:@"Victoria Nunez" title:@"Director of Sales" company:@"Magic Industries" picture:@"women25.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pam Moore" title:@"Director of Sales" company:@"Magic Industries" picture:@"women26.jpg"]];
            [instance.people addObject:[Person initWithName:@"Patti May" title:@"Director of Sales" company:@"Magic Industries" picture:@"women27.jpg"]];
            [instance.people addObject:[Person initWithName:@"Tasha Sparks" title:@"Director of Sales" company:@"Magic Industries" picture:@"women28.jpg"]];
            [instance.people addObject:[Person initWithName:@"Katrina Armstrong" title:@"Director of Sales" company:@"Magic Industries" picture:@"women29.jpg"]];
            [instance.people addObject:[Person initWithName:@"Nellie Love" title:@"Director of Sales" company:@"Magic Industries" picture:@"women30.jpg"]];
            [instance.people addObject:[Person initWithName:@"Silvia Stevenson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women31.jpg"]];
            [instance.people addObject:[Person initWithName:@"Margaret Wallace" title:@"Director of Sales" company:@"Magic Industries" picture:@"women32.jpg"]];
            [instance.people addObject:[Person initWithName:@"Anna Sanders" title:@"Director of Sales" company:@"Magic Industries" picture:@"women33.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kimberly Snyder" title:@"Director of Sales" company:@"Magic Industries" picture:@"women34.jpg"]];
            [instance.people addObject:[Person initWithName:@"Candace Santiago" title:@"Director of Sales" company:@"Magic Industries" picture:@"women35.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kristen Morris" title:@"Director of Sales" company:@"Magic Industries" picture:@"women36.jpg"]];
            [instance.people addObject:[Person initWithName:@"Alexis Francis" title:@"Director of Sales" company:@"Magic Industries" picture:@"women37.jpg"]];
            [instance.people addObject:[Person initWithName:@"Hazel Crr" title:@"Director of Sales" company:@"Magic Industries" picture:@"women38.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pamela Patterson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women39.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lola Valdez" title:@"Director of Sales" company:@"Magic Industries" picture:@"women40.jpg"]];
            [instance.people addObject:[Person initWithName:@"Gloria Rodgers" title:@"Director of Sales" company:@"Magic Industries" picture:@"women41.jpg"]];
            [instance.people addObject:[Person initWithName:@"Katie Reynolds" title:@"Director of Sales" company:@"Magic Industries" picture:@"women42.jpg"]];
            [instance.people addObject:[Person initWithName:@"Marha Ford" title:@"Director of Sales" company:@"Magic Industries" picture:@"women43.jpg"]];
            [instance.people addObject:[Person initWithName:@"Flora Buchanan" title:@"Director of Sales" company:@"Magic Industries" picture:@"women44.jpg"]];
            [instance.people addObject:[Person initWithName:@"Vivian Fowler" title:@"Director of Sales" company:@"Magic Industries" picture:@"women45.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rosie Swanson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women46.jpg"]];
            [instance.people addObject:[Person initWithName:@"Marion Erikson" title:@"Director of Sales" company:@"Magic Industries" picture:@"women47.jpg"]];
            [instance.people addObject:[Person initWithName:@"April Hayes" title:@"Director of Sales" company:@"Magic Industries" picture:@"women48.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lillie Vasquez" title:@"Director of Sales" company:@"Magic Industries" picture:@"women49.jpg"]];
            [instance.people addObject:[Person initWithName:@"Camille Bishop" title:@"Director of Sales" company:@"Magic Industries" picture:@"women50.jpg"]];

            
            
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
            [instance.meetings addObject:[self setName:@"TestMeeting" setDate:date setDesc:@"test meeting" setComp:@"NOM PEW LLC" setAddr:@"234 nom drive" setCity:@"nom" setStat:@"Nomtopia" setZip:@"1111111" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Annual Sales Report" setDate:date setDesc:@"This is a meeting to discuss the annual sales." setComp:@"The Republic" setAddr:@"Space" setCity:@"Space City" setStat:@"Tatooine" setZip:@"1234567" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Technology Report" setDate:date setDesc:@"Talk about the technological advances we are strivingto make" setComp:@"Death Star Inc" setAddr:@"1234 Death Star" setCity:@"Death Star" setStat:@"Space" setZip:@"54678" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Interview" setDate:date setDesc:@"Interview for potential candidates who really want a job!" setComp:@"Scrooge LLC" setAddr:@"123 Bah Humbug Lane" setCity:@"New York" setStat:@"New York" setZip:@"12345" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            dateComponents.day = 3;
            dateComponents.hour = 7;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Business Meeting" setDate:date setDesc:@"Meeting with a Potential Client" setComp:@"The Sales Company" setAddr:@"742 Cerulean Circuit" setCity:@"Indianapolis" setStat:@"Indiana" setZip:@"22506" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Meglomaniacs Meeting" setDate:date setDesc:@"A meeting of likeminded individuals who want to take over the world." setComp:@"The Truth Squad" setAddr:@"444 Truth Lane" setCity:@"Truth City" setStat:@"Tennessee" setZip:@"37128" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Monthly Financial Report" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            
            /* Find the next meeting */
            NSDate *todayDate = [NSDate date];
            
            NSPredicate *today = [NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
                return [evaluatedObject.date compare:todayDate] == NSOrderedDescending;
            }];
            
            instance.next = [[[instance.meetings filteredArrayUsingPredicate:today] sortedArrayUsingComparator:^(Meeting *m1, Meeting *m2) {
                return [[m1 date] compare:[m2 date]];
            }] objectAtIndex:0];
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
        setLocation:(CLLocation *)location
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
    meet.location = [location copy];
    meet.people = [people copy];
    meet.files = [files mutableCopy];
    
    return meet;
}

@end

