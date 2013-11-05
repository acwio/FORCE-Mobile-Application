//
//  PersonViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/4/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonViewController : UIViewController {
    Person *person;
}

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end
