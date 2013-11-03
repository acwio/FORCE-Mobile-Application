//
//  DataClass.h
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meeting.h"

@interface DataClass : NSObject {
    
    NSMutableArray *meetings;
    NSMutableArray *people;
    NSMutableArray *files;
}

@property(nonatomic,retain)NSMutableArray *meetings;
@property(nonatomic,retain)NSMutableArray *people;
@property(nonatomic,retain)NSMutableArray *files;

+(DataClass*)getInstance;

+(Meeting*) setName: (NSString *) name
        setDate: (NSString *) date
        setSTime:(NSString *) startTime
        setETime:(NSString *) endTime
        setDesc: (NSString *) description
        setComp: (NSString *) company
        setAddr: (NSString *) address
        setCity: (NSString *) city
        setStat: (NSString *) state
        setZip : (NSString *) zip
        setPeople: (NSMutableArray *) people
        setFiles:(NSMutableArray *) files;

@end

/*NSString *name;     //name of a person
 NSString *title;    //title in the company
 NSString *company;  //company person works for
 NSString *picURL;   //URL of person's picture
 */
