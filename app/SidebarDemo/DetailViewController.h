//
//  DetailViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meeting.h"

@interface DetailViewController : UIViewController {
    NSString *data;
    Meeting *meeting;
}

@property (nonatomic, strong) Meeting *meeting;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *companyLabel;
@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;

@end
