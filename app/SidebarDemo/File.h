//
//  File.h
//  FORCE
//
//  Created by nep2d on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject
{
    NSString *name;     //name of a person
    NSString *path;   //URL of person's picture
}
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *path;

+(File*)getInstance;
@end