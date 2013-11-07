//
//  DataClass.h
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Meeting.h"

@interface DataClass : NSObject {
    
    NSMutableArray *meetings;
    NSMutableArray *people;
    NSMutableArray *files;
    
    Meeting *next;
}

@property(nonatomic,retain)NSMutableArray *meetings;
@property(nonatomic,retain)NSMutableArray *people;
@property(nonatomic,retain)NSMutableArray *files;
@property(nonatomic,retain)Meeting *next;

+(DataClass*)getInstance;

+(Meeting*) setName: (NSString *) name
        setDate: (NSDate *) date
        setDesc: (NSString *) description
        setComp: (NSString *) company
        setAddr: (NSString *) address
        setCity: (NSString *) city
        setStat: (NSString *) state
        setZip : (NSString *) zip
        setLocation: (CLLocation *) location
        setPeople: (NSMutableArray *) people
        setFiles:(NSMutableArray *) files;

@end

/*NSString *name;     //name of a person
 NSString *title;    //title in the company
 NSString *company;  //company person works for
 NSString *picURL;   //URL of person's picture
 */
