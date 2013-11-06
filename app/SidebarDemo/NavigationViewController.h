//
//  NavigationViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/2/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARKit.h"
#import "DetailView.h"

@interface NavigationViewController : UIViewController <ARViewDelegate>{
    NSArray *points;
    ARKitEngine *engine;

    NSInteger selectedIndex;
    DetailView *currentDetailView;
}

@end
