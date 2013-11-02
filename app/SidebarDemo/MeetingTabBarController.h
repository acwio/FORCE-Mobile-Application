//
//  MeetingTabBarController.h
//  FORCE
//
//  Created by Nathan Reale on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Meeting.h"

@interface MeetingTabBarController : UITabBarController {
    NSString *data;
    Meeting *meeting;
}

@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) Meeting *meeting;

@end
