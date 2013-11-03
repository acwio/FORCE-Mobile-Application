//
//  PeopleDetailViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/3/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meeting.h"

@interface PeopleDetailViewController : UITableViewController {
    Meeting *meeting;
}

@property (nonatomic, strong) Meeting *meeting;
@end
