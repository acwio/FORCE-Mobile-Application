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
    
}
@property(nonatomic,retain)NSMutableArray *meetings;
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
        setZip : (NSString *) zip;
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