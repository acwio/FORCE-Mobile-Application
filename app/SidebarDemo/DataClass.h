//
//  DataClass.h
//  FORCE
//
//  Created by nep2d on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <Foundation/Foundation.h>


//http://stackoverflow.com/questions/6065965/how-to-define-a-global-variable-that-can-be-accessed-anywhere-in-my-application

@interface DataClass : NSObject {
    
    NSMutableArray *meetings;
    
}
@property(nonatomic,retain)NSMutableArray *meetings;
+(DataClass*)getInstance;
@end
