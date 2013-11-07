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
            /*[instance.people addObject:[Person initWithName:@"Magic Karp" title:@"Splash" company:@"Poke E Monn" picture:@"user.png"]];
            [instance.people addObject:[Person initWithName:@"Gyra Dos" title:@"Dragon-like" company:@"Poke E Monn" picture:@"calendar_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Dragon Ite" title:@"More Dragon-like" company:@"Poke E Monn" picture:@"bookmark_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ampha Ros" title:@"Who?" company:@"Poke E Monn" picture:@"comments_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Squirtle Squad" title:@"Worst Pokemon ever" company:@"Poke E Monn" picture:@"tag_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pika Chu" title:@"Pika Pika" company:@"Poke E Monn" picture:@"wishlist_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ry Don" title:@"The Boss" company:@"Poke E Monn" picture:@"calendar_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Chari Zard" title:@"The BE(a)ST" company:@"Poke E Monn" picture:@"bookmark_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Blast Oise" title:@"Okay, I guess" company:@"Poke E Monn" picture:@"comments_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Venus Aur" title:@"Terrible" company:@"Poke E Monn" picture:@"tag_photo.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cle Fable" title:@"Cle-who?" company:@"Poke E Monn" picture:@"wishlist_photo.jpg"]];*/
            
            [instance.people addObject:[Person initWithName:@"Mark Hamilton" title:@"Chairman" company:@"Magic Industries" picture:@"men1.jpg"]];
            [instance.people addObject:[Person initWithName:@"Donald White" title:@"Vice Chairman" company:@"Magic Industries" picture:@"men2.jpg"]];
            [instance.people addObject:[Person initWithName:@"Owen Thomas" title:@"President" company:@"Magic Industries" picture:@"men3.jpg"]];
            [instance.people addObject:[Person initWithName:@"Stephen Thompson" title:@"Senior Vice President" company:@"Magic Industries" picture:@"men4.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angel Griffen" title:@"Junior Vice President" company:@"Magic Industries" picture:@"men5.jpg"]];
            [instance.people addObject:[Person initWithName:@"Aiden Howard" title:@"General Manager" company:@"Magic Industries" picture:@"men6.jpg"]];
            [instance.people addObject:[Person initWithName:@"George Bell" title:@"Section Head" company:@"Drivers LLC" picture:@"men7.jpg"]];
            [instance.people addObject:[Person initWithName:@"Evan Watson" title:@"Assistant Manager" company:@"Drivers LLC" picture:@"men8.jpg"]];
            [instance.people addObject:[Person initWithName:@"Abraham Davidson" title:@"Software Developer" company:@"Drivers LLC" picture:@"men9.jpg"]];
            [instance.people addObject:[Person initWithName:@"Josh Manning" title:@"Director of IT" company:@"Drivers LLC" picture:@"men10.jpg"]];
            [instance.people addObject:[Person initWithName:@"Loren Ford" title:@"Web Developer" company:@"Battle Hardened" picture:@"men11.jpg"]];
            [instance.people addObject:[Person initWithName:@"Shane Stone" title:@"Chief Accounting Officer" company:@"Battle Hardened" picture:@"men12.jpg"]];
            [instance.people addObject:[Person initWithName:@"Zachary Gibbs" title:@"Chief Operations Officer" company:@"Battle Hardened" picture:@"men13.jpg"]];
            [instance.people addObject:[Person initWithName:@"Brandon Mckinney" title:@"General Manager" company:@"Battle Hardened" picture:@"men14.jpg"]];
            [instance.people addObject:[Person initWithName:@"Orlando Williamson" title:@"Section Head" company:@"ImageTech LLC" picture:@"men15.jpg"]];
            [instance.people addObject:[Person initWithName:@"Jorge Curry" title:@"Assistant Manager" company:@"ImageTech LLC" picture:@"men16.jpg"]];
            [instance.people addObject:[Person initWithName:@"Andrew Tran" title:@"Software Developer" company:@"ImageTech LLC" picture:@"men17.jpg"]];
            [instance.people addObject:[Person initWithName:@"Owen Lynch" title:@"Director of Marketing" company:@"ImageTech LLC" picture:@"men18.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lyle Soto" title:@"Director of Relations" company:@"ImageTech LLC" picture:@"men19.jpg"]];
            [instance.people addObject:[Person initWithName:@"Herbert Walker" title:@"Web Developer" company:@"ImageTech LLC" picture:@"men20.jpg"]];
            [instance.people addObject:[Person initWithName:@"Samuel Wilkins" title:@"Staff" company:@"Magic Industries" picture:@"men21.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elias Higgins" title:@"Staff" company:@"Magic Industries" picture:@"men22.jpg"]];
            [instance.people addObject:[Person initWithName:@"Miguel Craid" title:@"Staff" company:@"Magic Industries" picture:@"men23.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cesar Medina" title:@"Staff" company:@"Magic Industries" picture:@"men24.jpg"]];
            [instance.people addObject:[Person initWithName:@"Seth Torres" title:@"Staff" company:@"Magic Industries" picture:@"men25.jpg"]];
            [instance.people addObject:[Person initWithName:@"Michael Moss" title:@"Chairman" company:@"Poke E Mon" picture:@"men26.jpg"]];
            [instance.people addObject:[Person initWithName:@"Levi Andrews" title:@"Vice Chairman" company:@"Poke E Mon" picture:@"men27.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cameron Cortez" title:@"President" company:@"Poke E Mon" picture:@"men28.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rodney Rios" title:@"Junior Vice President" company:@"Poke E Mon" picture:@"men29.jpg"]];
            [instance.people addObject:[Person initWithName:@"Eugene Pena" title:@"Senior Vice President" company:@"Poke E Mon" picture:@"men30.jpg"]];
            [instance.people addObject:[Person initWithName:@"Tyler Sanders" title:@"Deputy General Manager" company:@"Poke E Mon" picture:@"men31.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kyle Carson" title:@"Manager" company:@"Poke E Mon" picture:@"men32.jpg"]];
            [instance.people addObject:[Person initWithName:@"Brendan Bridges" title:@"Director of IT" company:@"Poke E Mon" picture:@"men33.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angelo Ray" title:@"Section Head" company:@"Poke E Mon" picture:@"men34.jpg"]];
            [instance.people addObject:[Person initWithName:@"Robert Wong" title:@"Software Developer" company:@"Poke E Mon" picture:@"men35.jpg"]];
            [instance.people addObject:[Person initWithName:@"Bert Ortega" title:@"Web Developer" company:@"LOGITEQS" picture:@"men36.jpg"]];
            [instance.people addObject:[Person initWithName:@"Scott Norman" title:@"Software Developer" company:@"LOGITEQS" picture:@"men37.jpg"]];
            [instance.people addObject:[Person initWithName:@"Fernando Duncan" title:@"Staff" company:@"LOGITEQS" picture:@"men38.jpg"]];
            [instance.people addObject:[Person initWithName:@"Ray Lindsay" title:@"Staff" company:@"LOGITEQS" picture:@"men39.jpg"]];
            [instance.people addObject:[Person initWithName:@"Abel Pratt" title:@"Chairman" company:@"LOGITEQS" picture:@"men40.jpg"]];
            [instance.people addObject:[Person initWithName:@"Mario Ramos" title:@"President" company:@"LOGITEQS" picture:@"men41.jpg"]];
            [instance.people addObject:[Person initWithName:@"Thomas Bishop" title:@"Senior Vice President" company:@"LOGITEQS" picture:@"men42.jpg"]];
            [instance.people addObject:[Person initWithName:@"Courtney Stewart" title:@"Chief Operating Officer" company:@"LOGITEQS" picture:@"men43.jpg"]];
            [instance.people addObject:[Person initWithName:@"Victor Thompson" title:@"Project Lead" company:@"LOGITEQS" picture:@"men44.jpg"]];
            [instance.people addObject:[Person initWithName:@"Myron Green" title:@"Software Developer" company:@"LOGITEQS" picture:@"men45.jpg"]];
            [instance.people addObject:[Person initWithName:@"Dewey Gilbert" title:@"Software Developer" company:@"LOGITEQS" picture:@"men46.jpg"]];
            [instance.people addObject:[Person initWithName:@"Mike Fuller" title:@"Software Developer" company:@"LOGITEQS" picture:@"men47.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kelly Lawson" title:@"Web Developer" company:@"Penny Arcade" picture:@"men48.jpg"]];
            [instance.people addObject:[Person initWithName:@"Terrance Dawson" title:@"Staff" company:@"Penny Arcade" picture:@"men49.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lynn Weber" title:@"Staff" company:@"Penny Arcade" picture:@"men50.jpg"]];
 
            
            [instance.people addObject:[Person initWithName:@"Ernestine Todd" title:@"Chairman" company:@"Penny Arcade" picture:@"women1.jpg"]];
            [instance.people addObject:[Person initWithName:@"Janie Young" title:@"Vice Chairman" company:@"Penny Arcade" picture:@"women2.jpg"]];
            [instance.people addObject:[Person initWithName:@"Sophie Carson" title:@"Director of Sales" company:@"Penny Arcade" picture:@"women3.jpg"]];
            [instance.people addObject:[Person initWithName:@"Maxine Poole" title:@"Director of Sales" company:@"Penny Arcade" picture:@"women4.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rebecca Hardy" title:@"Software Developer" company:@"Penny Arcade" picture:@"women5.jpg"]];
            [instance.people addObject:[Person initWithName:@"Johnnie Palmer" title:@"Web Designer" company:@"Battle Hardened" picture:@"women6.jpg"]];
            [instance.people addObject:[Person initWithName:@"Beatrice Turner" title:@"Software Developer" company:@"Battle Hardened" picture:@"women7.jpg"]];
            [instance.people addObject:[Person initWithName:@"Angie Gibson" title:@"Software Developer" company:@"Battle Hardened" picture:@"women8.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lucia White" title:@"Software Developer" company:@"Battle Hardened" picture:@"women9.jpg"]];
            [instance.people addObject:[Person initWithName:@"Sonna Wright" title:@"Software Developer" company:@"Battle Hardened" picture:@"women10.jpg"]];
            [instance.people addObject:[Person initWithName:@"Eloise Cross" title:@"Software Developer" company:@"Battle Hardened" picture:@"women11.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kelli Martinez" title:@"Web Developer" company:@"Battle Hardened" picture:@"women12.jpg"]];
            [instance.people addObject:[Person initWithName:@"Velma Hamilton" title:@"Web Developer" company:@"ImageTech LLC" picture:@"women13.jpg"]];
            [instance.people addObject:[Person initWithName:@"Nicole Aguilar" title:@"Web Developer" company:@"ImageTech LLC" picture:@"women14.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elsa Goodwin" title:@"Web Developer" company:@"ImageTech LLC" picture:@"women15.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lynda Fuller" title:@"Web Developer" company:@"ImageTech LLC" picture:@"women16.jpg"]];
            [instance.people addObject:[Person initWithName:@"Yvette Pratt" title:@"Chairman" company:@"ImageTech LLC" picture:@"women17.jpg"]];
            [instance.people addObject:[Person initWithName:@"Teresa Murphy" title:@"Director of the Board" company:@"ImageTech LLC" picture:@"women18.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kristi Cortez" title:@"President" company:@"ImageTech LLC" picture:@"women19.jpg"]];
            [instance.people addObject:[Person initWithName:@"Krista Ryan" title:@"President" company:@"Video Gaming INC" picture:@"women20.jpg"]];
            [instance.people addObject:[Person initWithName:@"Leona Warner" title:@"President" company:@"Video Gaming INC" picture:@"women21.jpg"]];
            [instance.people addObject:[Person initWithName:@"Elisa Mcdaniel" title:@"President" company:@"Video Gaming INC" picture:@"women22.jpg"]];
            [instance.people addObject:[Person initWithName:@"Cristina Mccarthy" title:@"Staff" company:@"Video Gaming INC" picture:@"women23.jpg"]];
            [instance.people addObject:[Person initWithName:@"Jaime Gregory" title:@"Staff" company:@"Video Gaming INC" picture:@"women24.jpg"]];
            [instance.people addObject:[Person initWithName:@"Victoria Nunez" title:@"Staff" company:@"Magic Industries" picture:@"women25.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pam Moore" title:@"Staff" company:@"Magic Industries" picture:@"women26.jpg"]];
            [instance.people addObject:[Person initWithName:@"Patti May" title:@"Staff" company:@"Magic Industries" picture:@"women27.jpg"]];
            [instance.people addObject:[Person initWithName:@"Tasha Sparks" title:@"Staff" company:@"Magic Industries" picture:@"women28.jpg"]];
            [instance.people addObject:[Person initWithName:@"Katrina Armstrong" title:@"Staff" company:@"Magic Industries" picture:@"women29.jpg"]];
            [instance.people addObject:[Person initWithName:@"Nellie Love" title:@"Staff" company:@"Magic Industries" picture:@"women30.jpg"]];
            [instance.people addObject:[Person initWithName:@"Silvia Stevenson" title:@"Staff" company:@"Magic Industries" picture:@"women31.jpg"]];
            [instance.people addObject:[Person initWithName:@"Margaret Wallace" title:@"Assistant Manager" company:@"Magic Industries" picture:@"women32.jpg"]];
            [instance.people addObject:[Person initWithName:@"Anna Sanders" title:@"Assistant Manager" company:@"Magic Industries" picture:@"women33.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kimberly Snyder" title:@"Assistant Manager" company:@"Magic Industries" picture:@"women34.jpg"]];
            [instance.people addObject:[Person initWithName:@"Candace Santiago" title:@"Assistant Manager" company:@"Poke E Mon" picture:@"women35.jpg"]];
            [instance.people addObject:[Person initWithName:@"Kristen Morris" title:@"Assistant Manager" company:@"Poke E Mon" picture:@"women36.jpg"]];
            [instance.people addObject:[Person initWithName:@"Alexis Francis" title:@"Assistant Manager" company:@"Poke E Mon" picture:@"women37.jpg"]];
            [instance.people addObject:[Person initWithName:@"Hazel Crr" title:@"Manager" company:@"Poke E Mon" picture:@"women38.jpg"]];
            [instance.people addObject:[Person initWithName:@"Pamela Patterson" title:@"Manager" company:@"Poke E Mon" picture:@"women39.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lola Valdez" title:@"Manager" company:@"Poke E Mon" picture:@"women40.jpg"]];
            [instance.people addObject:[Person initWithName:@"Gloria Rodgers" title:@"Manager" company:@"Poke E Mon" picture:@"women41.jpg"]];
            [instance.people addObject:[Person initWithName:@"Katie Reynolds" title:@"Manager" company:@"Drivers LLC" picture:@"women42.jpg"]];
            [instance.people addObject:[Person initWithName:@"Marha Ford" title:@"Manager" company:@"Drivers LLC" picture:@"women43.jpg"]];
            [instance.people addObject:[Person initWithName:@"Flora Buchanan" title:@"Vice President" company:@"Drivers LLC" picture:@"women44.jpg"]];
            [instance.people addObject:[Person initWithName:@"Vivian Fowler" title:@"Vice President" company:@"Drivers LLC" picture:@"women45.jpg"]];
            [instance.people addObject:[Person initWithName:@"Rosie Swanson" title:@"Vice President" company:@"Drivers LLC" picture:@"women46.jpg"]];
            [instance.people addObject:[Person initWithName:@"Marion Erikson" title:@"Vice President" company:@"Drivers LLC" picture:@"women47.jpg"]];
            [instance.people addObject:[Person initWithName:@"April Hayes" title:@"Software Developer" company:@"Drivers LLC" picture:@"women48.jpg"]];
            [instance.people addObject:[Person initWithName:@"Lillie Vasquez" title:@"Software Developer" company:@"Drivers LLC" picture:@"women49.jpg"]];
            [instance.people addObject:[Person initWithName:@"Camille Bishop" title:@"Software Developer" company:@"Drivers LLC" picture:@"women50.jpg"]];

            //shuffle people
            static BOOL seeded = NO;
            if(!seeded)
            {
                seeded = YES;
                srandom(time(NULL));
            }
            
            NSUInteger count = [instance.people count];
            for (NSUInteger i = 0; i < count; ++i) {
                // Select a random element between i and end of array to swap with.
                int nElements = count - i;
                int n = (random() % nElements) + i;
                [instance.people exchangeObjectAtIndex:i withObjectAtIndex:n];
            }
            
            //set up all files
            [instance.files addObject:[File initWithName:@"Force PDF" path:@"force.pdf"]];
            [instance.files addObject:[File initWithName:@"Code Documentation" path:@"Person.txt"]];
            [instance.files addObject:[File initWithName:@"User Picture" path:@"user.png"]];
            [instance.files addObject:[File initWithName:@"Calender Icon" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"Space" path:@"img1.jpg"]];
            [instance.files addObject:[File initWithName:@"The Final Fronteir" path:@"img2.jpg"]];
            [instance.files addObject:[File initWithName:@"Outer Space" path:@"img3.jpg"]];
            [instance.files addObject:[File initWithName:@"Starry Sky" path:@"calendar_photo.jpg"]];
            [instance.files addObject:[File initWithName:@"The future of Mankind" path:@"img4.jpg"]];
            [instance.files addObject:[File initWithName:@"Shoot for the..." path:@"img5.jpg"]];
            [instance.files addObject:[File initWithName:@"Timey Wimey" path:@"img6.jpg"]];
            [instance.files addObject:[File initWithName:@"Broaden Your Horizons" path:@"img7.jpg"]];
            [instance.files addObject:[File initWithName:@"Conducting Business Meetings" path:@"ppt1.ppt"]];
            [instance.files addObject:[File initWithName:@"Meeting PPT" path:@"ppt2.ppt"]];
            [instance.files addObject:[File initWithName:@"Report1" path:@"pdf1.pdf"]];
            [instance.files addObject:[File initWithName:@"Report2" path:@"pdf2.pdf"]];
            
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
            [mPeople addObject:[instance.people objectAtIndex:10]];
            [mPeople addObject:[instance.people objectAtIndex:12]];
            [mPeople addObject:[instance.people objectAtIndex:14]];
            [mPeople addObject:[instance.people objectAtIndex:15]];
            [mPeople addObject:[instance.people objectAtIndex:16]];
            [mPeople addObject:[instance.people objectAtIndex:18]];
            [mPeople addObject:[instance.people objectAtIndex:20]];
            [mPeople addObject:[instance.people objectAtIndex:22]];
            [mPeople addObject:[instance.people objectAtIndex:24]];
            [mPeople addObject:[instance.people objectAtIndex:25]];
            [mPeople addObject:[instance.people objectAtIndex:26]];
            [mPeople addObject:[instance.people objectAtIndex:28]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:0]];
            [mFiles addObject:[instance.files objectAtIndex:1]];
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:6]];
            [mFiles addObject:[instance.files objectAtIndex:12]];
            [mFiles addObject:[instance.files objectAtIndex:15]];
            
            //set up date
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 9;
            dateComponents.hour = 10;
            NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            //assign a meeting
            [instance.meetings addObject:[self setName:@"Staff Meeting" setDate:date setDesc:@"A meeting in which staff meet to discuss business." setComp:@"Drivers LLC" setAddr:@"1770 Shady Willow Crescent" setCity:@"Elf" setStat:@"Utah" setZip:@"84234" setLocation:location setPeople:mPeople setFiles:mFiles]];
            //empty mPeople and mFiles
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            
            //meeting 2
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:99]];
            [mPeople addObject:[instance.people objectAtIndex:98]];
            [mPeople addObject:[instance.people objectAtIndex:92]];
            [mPeople addObject:[instance.people objectAtIndex:93]];
            [mPeople addObject:[instance.people objectAtIndex:89]];
            [mPeople addObject:[instance.people objectAtIndex:88]];
            [mPeople addObject:[instance.people objectAtIndex:82]];
            [mPeople addObject:[instance.people objectAtIndex:83]];
            [mPeople addObject:[instance.people objectAtIndex:79]];
            [mPeople addObject:[instance.people objectAtIndex:78]];
            [mPeople addObject:[instance.people objectAtIndex:72]];
            [mPeople addObject:[instance.people objectAtIndex:73]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:1]];
            [mFiles addObject:[instance.files objectAtIndex:2]];
            [mFiles addObject:[instance.files objectAtIndex:3]];
            [mFiles addObject:[instance.files objectAtIndex:4]];
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:6]];
            
            //set up date
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 12;
            dateComponents.hour = 10;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Annual Sales Report" setDate:date setDesc:@"This is a meeting to discuss the annual sales." setComp:@"Poke E Monn" setAddr:@"5047 Little Hill" setCity:@"Promise City" setStat:@"Arkansas" setZip:@"72890" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [mPeople addObject:[instance.people objectAtIndex:20]];
            [mPeople addObject:[instance.people objectAtIndex:22]];
            [mPeople addObject:[instance.people objectAtIndex:24]];
            [mPeople addObject:[instance.people objectAtIndex:25]];
            [mPeople addObject:[instance.people objectAtIndex:26]];
            [mPeople addObject:[instance.people objectAtIndex:28]];
            [mPeople addObject:[instance.people objectAtIndex:30]];
            [mPeople addObject:[instance.people objectAtIndex:32]];
            [mPeople addObject:[instance.people objectAtIndex:34]];
            [mPeople addObject:[instance.people objectAtIndex:35]];
            [mPeople addObject:[instance.people objectAtIndex:36]];
            [mPeople addObject:[instance.people objectAtIndex:38]];
            [mPeople addObject:[instance.people objectAtIndex:40]];
            [mPeople addObject:[instance.people objectAtIndex:42]];
            [mPeople addObject:[instance.people objectAtIndex:44]];
            [mPeople addObject:[instance.people objectAtIndex:45]];
            [mPeople addObject:[instance.people objectAtIndex:46]];
            [mPeople addObject:[instance.people objectAtIndex:48]];
            [mPeople addObject:[instance.people objectAtIndex:50]];
            [mPeople addObject:[instance.people objectAtIndex:52]];
            [mPeople addObject:[instance.people objectAtIndex:54]];
            [mPeople addObject:[instance.people objectAtIndex:55]];
            [mPeople addObject:[instance.people objectAtIndex:56]];
            [mPeople addObject:[instance.people objectAtIndex:58]];
            [mPeople addObject:[instance.people objectAtIndex:60]];
            [mPeople addObject:[instance.people objectAtIndex:62]];
            [mPeople addObject:[instance.people objectAtIndex:64]];
            [mPeople addObject:[instance.people objectAtIndex:65]];
            [mPeople addObject:[instance.people objectAtIndex:66]];
            [mPeople addObject:[instance.people objectAtIndex:68]];
            [mPeople addObject:[instance.people objectAtIndex:1]];
            [mPeople addObject:[instance.people objectAtIndex:3]];
            [mPeople addObject:[instance.people objectAtIndex:7]];
            [mPeople addObject:[instance.people objectAtIndex:9]];
            [mPeople addObject:[instance.people objectAtIndex:11]];
            [mPeople addObject:[instance.people objectAtIndex:13]];
            [mPeople addObject:[instance.people objectAtIndex:15]];
            [mPeople addObject:[instance.people objectAtIndex:17]];
            [mPeople addObject:[instance.people objectAtIndex:19]];
            [mPeople addObject:[instance.people objectAtIndex:21]];
            [mPeople addObject:[instance.people objectAtIndex:23]];
            [mPeople addObject:[instance.people objectAtIndex:25]];
            [mPeople addObject:[instance.people objectAtIndex:27]];
            [mPeople addObject:[instance.people objectAtIndex:29]];
            [mPeople addObject:[instance.people objectAtIndex:31]];
            [mPeople addObject:[instance.people objectAtIndex:95]];
            [mPeople addObject:[instance.people objectAtIndex:96]];
            [mPeople addObject:[instance.people objectAtIndex:98]];
            [mPeople addObject:[instance.people objectAtIndex:80]];
            [mPeople addObject:[instance.people objectAtIndex:82]];
            [mPeople addObject:[instance.people objectAtIndex:84]];
            [mPeople addObject:[instance.people objectAtIndex:85]];
            [mPeople addObject:[instance.people objectAtIndex:86]];
            [mPeople addObject:[instance.people objectAtIndex:88]];
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
            [mFiles addObject:[instance.files objectAtIndex:11]];
            [mFiles addObject:[instance.files objectAtIndex:12]];
            [mFiles addObject:[instance.files objectAtIndex:13]];
            [mFiles addObject:[instance.files objectAtIndex:14]];
            [mFiles addObject:[instance.files objectAtIndex:15]];
            
            dateComponents.year = 2003;
            dateComponents.month = 02;
            dateComponents.day = 01;
            dateComponents.hour = 6;
            dateComponents.minute = 30;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Technology Report" setDate:date setDesc:@"Talk about the technological advances we are striving to make. Let the team know about how good the future looks!" setComp:@"Magic Industries" setAddr:@"663 Red Embers Wharf" setCity:@"Nashville" setStat:@"Tennessee" setZip:@"37130" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Meeting of Sales" setDate:date setDesc:@"A meeting of likeminded individuals who want to take over the world." setComp:@"The Truth Squad" setAddr:@"444 Truth Lane" setCity:@"Truth City" setStat:@"Tennessee" setZip:@"37128" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            
            //meeting 7
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:50]];
            [mPeople addObject:[instance.people objectAtIndex:51]];
            [mPeople addObject:[instance.people objectAtIndex:57]];
            [mPeople addObject:[instance.people objectAtIndex:55]];
            [mPeople addObject:[instance.people objectAtIndex:53]];
            [mPeople addObject:[instance.people objectAtIndex:60]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            
            dateComponents.year = 2013;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Financial Report" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            //meeting 7
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:40]];
            [mPeople addObject:[instance.people objectAtIndex:41]];
            [mPeople addObject:[instance.people objectAtIndex:47]];
            [mPeople addObject:[instance.people objectAtIndex:45]];
            [mPeople addObject:[instance.people objectAtIndex:43]];
            [mPeople addObject:[instance.people objectAtIndex:20]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            
            dateComponents.year = 2013;
            dateComponents.month = 12;
            dateComponents.day = 04;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Report" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            //meeting 7
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:30]];
            [mPeople addObject:[instance.people objectAtIndex:13]];
            [mPeople addObject:[instance.people objectAtIndex:37]];
            [mPeople addObject:[instance.people objectAtIndex:53]];
            [mPeople addObject:[instance.people objectAtIndex:33]];
            [mPeople addObject:[instance.people objectAtIndex:31]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            
            dateComponents.year = 2013;
            dateComponents.month = 10;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Technical Meeting on Future" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
            [mPeople removeAllObjects];
            [mFiles removeAllObjects];
            
            //meeting 7
            //assign people
            [mPeople addObject:[instance.people objectAtIndex:90]];
            [mPeople addObject:[instance.people objectAtIndex:91]];
            [mPeople addObject:[instance.people objectAtIndex:97]];
            [mPeople addObject:[instance.people objectAtIndex:95]];
            [mPeople addObject:[instance.people objectAtIndex:93]];
            [mPeople addObject:[instance.people objectAtIndex:9]];
            //assign files
            [mFiles addObject:[instance.files objectAtIndex:5]];
            [mFiles addObject:[instance.files objectAtIndex:10]];
            
            dateComponents.year = 2014;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"All Staff Meeting" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            
            dateComponents.year = 2015;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Staff Meeting" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            
            dateComponents.year = 2016;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Interview Day 1" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            
            dateComponents.year = 2017;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Interview Day 2" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            
            dateComponents.year = 2018;
            dateComponents.month = 11;
            dateComponents.day = 05;
            dateComponents.hour = 8;
            dateComponents.minute = 45;
            
            date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
            [instance.meetings addObject:[self setName:@"Statistical Analysis" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Foundation Report" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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
            [instance.meetings addObject:[self setName:@"Billy Joel Concert" setDate:date setDesc:@"This meeting covers all financial relations of the past month." setComp:@"Queen Industries" setAddr:@"654 Queen Avenue" setCity:@"Starling City" setStat:@"DCState" setZip:@"12223" setLocation:location setPeople:mPeople setFiles:mFiles]];
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

