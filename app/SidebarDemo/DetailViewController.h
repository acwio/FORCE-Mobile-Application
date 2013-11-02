//
//  DetailViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    NSString *data;
}

@property (nonatomic, strong) IBOutlet UILabel *label;

@end
