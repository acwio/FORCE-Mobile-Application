//
//  MeetingViewController.m
//  FORCE
//
//  Created by Alex on 10/27/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "MeetingViewController.h"
#import "MeetingTabBarController.h"
#import "SWRevealViewController.h"
#import "DataClass.h"

@interface MeetingViewController ()

@end

@implementation MeetingViewController

NSArray *meetings;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataClass *data=[DataClass getInstance];
    meetings = [data.meetings sortedArrayUsingComparator:^(Meeting *m1, Meeting *m2) {
        return [[m1 date] compare:[m2 date]];
    }];
    
    
    
    self.title = @"Archive";
    //self.view.backgroundColor = [UIColor clearColor];
    //self.view.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.477 blue: 1.0 alpha:1.0];
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    //_sidebarButton.target = self.revealViewController;
    //_sidebarButton.action = @selector(revealToggle:);
    
    /* navigation bar button */
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10.0, 2.0, 28.0, 20.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"Nav_Icon.png"] forState:UIControlStateNormal];
    [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=barBtn;
    /* navigation bar button */
    
    /* search bar button */
    UIButton *btn2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(10.0, 2.0, 26.0, 20.0)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"Search_Magnify_Icon.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self.navigationController.searchDisplayController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    self.navigationItem.rightBarButtonItem=barBtn2;
    /* search bar button */

}

// This is called both on load and after returning to this view
// The gestures need to be set both times, so that was moved here.
- (void)viewDidAppear:(BOOL)animated
{
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [meetings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Meeting *meet = [meetings objectAtIndex:indexPath.row];
    
    cell.textLabel.text = meet.name;
    
    for (UIView *subview in self.searchDisplayController.searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
    }
    
    return cell;
}


// Called when you click on an item in the search results
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Create a new meeting page, using the identifier defined in Storyboard
    MeetingTabBarController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetingTabBar"];
    stubController.view.backgroundColor = [UIColor whiteColor];
    
    Meeting *meet = [meetings objectAtIndex:indexPath.row];
    stubController.title = meet.name;
    stubController.meeting = meet;
    
    // Add the swipe gestures. I couldn't figure out a way to add those in the tab bar controller because it does not have
    // a reference to revealViewController
    [stubController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Push the new meeting page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:YES];
    
}


@end
