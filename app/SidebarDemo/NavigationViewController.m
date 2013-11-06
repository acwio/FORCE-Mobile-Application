//
//  NavigationViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/2/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "NavigationViewController.h"
#import "MeetingTabBarController.h"
#import <CoreLocation/CoreLocation.h>
#import "Meeting.h"

@interface NavigationViewController ()

@end


@implementation NavigationViewController

- (void) viewDidLoad {
    selectedIndex = -1;
    
    /* get meeting object and assign it's location to the on-screen array */
    Meeting *meeting = ((MeetingTabBarController *)self.tabBarController).meeting;
    CLLocation *location = meeting.location;
    ARGeoCoordinate *cat = [ARGeoCoordinate coordinateWithLocation:location];
    cat.dataObject = meeting.company;
    points = @[cat];

    /* setup and retrieve configuration settings */
    ARKitConfig *config = [ARKitConfig defaultConfigFor:self];
    config.orientation = self.interfaceOrientation;
    
    CGSize s = [UIScreen mainScreen].bounds.size;
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        config.radarPoint = CGPointMake(s.width - 50, s.height - 50);
    } else {
        config.radarPoint = CGPointMake(s.height - 50, s.width - 50);
    }
    
    /* display a close button to escape the AR Navigation View (calls closeAR when pressed) */
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeBtn sizeToFit];
    [closeBtn addTarget:self action:@selector(closeAr) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.center = CGPointMake(50, 50);
    
    /* start the AR engine */
    engine = [[ARKitEngine alloc] initWithConfig:config];
    [engine addCoordinates:points];
    [engine addExtraView:closeBtn];
    [engine startListening];
}

- (void) closeAr {
    [engine hide];
}

#pragma mark - ARViewDelegate protocol Methods

- (ARObjectView *)viewForCoordinate:(ARGeoCoordinate *)coordinate floorLooking:(BOOL)floorLooking {
    NSString *text = (NSString *)coordinate.dataObject;
    
    ARObjectView *view = nil;
    
    if (floorLooking) {
        UIImage *arrowImg = [UIImage imageNamed:@"arrow.png"];
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:arrowImg];
        view = [[ARObjectView alloc] initWithFrame:arrowView.bounds];
        [view addSubview:arrowView];
        view.displayed = NO;
    } else {
        UIImageView *boxView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"box.png"]];
        boxView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(4, 16, boxView.frame.size.width - 8, 20)];
        lbl.font = [UIFont systemFontOfSize:17];
        lbl.minimumFontSize = 2;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor whiteColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = text;
        lbl.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        view = [[ARObjectView alloc] initWithFrame:boxView.frame];
        [view addSubview:boxView];
        [view addSubview:lbl];
    }
    
    [view sizeToFit];
    return view;
}

- (void) itemTouchedWithIndex:(NSInteger)index {
    selectedIndex = index;
    NSString *name = (NSString *)[engine dataObjectWithIndex:index];
   currentDetailView = [[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:nil options:nil][0];
    currentDetailView.nameLbl.text = name;
    [engine addExtraView:currentDetailView];
}

- (void) didChangeLooking:(BOOL)floorLooking {
    if (floorLooking) {
        if (selectedIndex != -1) {
            [currentDetailView removeFromSuperview];
            ARObjectView *floorView = [engine floorViewWithIndex:selectedIndex];
            floorView.displayed = YES;
        }
    } else {
        if (selectedIndex != -1) {
            ARObjectView *floorView = [engine floorViewWithIndex:selectedIndex];
            floorView.displayed = NO;
            selectedIndex = -1;
        }
    }
}

@end