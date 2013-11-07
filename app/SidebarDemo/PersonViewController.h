//
//  PersonViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/4/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    Person *person;
}

@property (nonatomic, strong) Person *person;

@property (nonatomic, strong) IBOutlet UITableView *meetingsTable;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *companyLabel;

- (IBAction)phone:(id)sender;
- (IBAction)email:(id)sender;

@end
