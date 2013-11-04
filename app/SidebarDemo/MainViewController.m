//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "MeetingTabBarController.h"
#import "DataClass.h"

@interface MainViewController ()

@end

@implementation MainViewController

NSArray *meetings;
NSMutableArray *groups;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    DataClass *data=[DataClass getInstance];
    meetings = [data.meetings sortedArrayUsingComparator:^(Meeting *m1, Meeting *m2) {
        return [[m1 date] compare:[m2 date]];
    }];
    
    NSDate *todayDate = [NSDate date];
    NSDate *tomDate = [todayDate dateByAddingTimeInterval:60*60*24];
    NSDate *nextWeekDate = [todayDate dateByAddingTimeInterval:60*60*24*7];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    
    groups = [[NSMutableArray alloc] init];
    
    NSPredicate *today = [NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
        return [[dateFormat stringFromDate:todayDate] isEqualToString:[dateFormat stringFromDate:evaluatedObject.date]];
    }];
    
    NSPredicate *tomorrow = [NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
        return [[dateFormat stringFromDate:tomDate] isEqualToString:[dateFormat stringFromDate:evaluatedObject.date]];
    }];
    
    NSPredicate *thisWeek = [NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
        return ([tomDate compare:evaluatedObject.date] == NSOrderedAscending) && ([evaluatedObject.date compare:nextWeekDate] == NSOrderedAscending);
    }];
    
    NSPredicate *later = [NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
        return ([nextWeekDate compare:evaluatedObject.date] == NSOrderedAscending);
    }];
    
    NSArray *itemsArray;
    NSMutableDictionary *itemsArrayDict;
    
    itemsArray = [meetings filteredArrayUsingPredicate:today];
    if ([itemsArray count] > 0) {
        itemsArrayDict = [NSMutableDictionary dictionaryWithObject:itemsArray forKey:@"data"];
        [itemsArrayDict setValue:@"Today" forKey:@"title"];
        [groups addObject:[itemsArrayDict copy]];
    }
    
    itemsArray = [meetings filteredArrayUsingPredicate:tomorrow];
    if ([itemsArray count] > 0) {
        itemsArrayDict = [NSMutableDictionary dictionaryWithObject:itemsArray forKey:@"data"];
        [itemsArrayDict setValue:@"Tomorrow" forKey:@"title"];
        [groups addObject:[itemsArrayDict copy]];
    }
    
    itemsArray = [meetings filteredArrayUsingPredicate:thisWeek];
    if ([itemsArray count] > 0) {
        itemsArrayDict = [NSMutableDictionary dictionaryWithObject:itemsArray forKey:@"data"];
        [itemsArrayDict setValue:@"This Week" forKey:@"title"];
        [groups addObject:[itemsArrayDict copy]];
    }
    itemsArray = [meetings filteredArrayUsingPredicate:later];
    if ([itemsArray count] > 0) {
        itemsArrayDict = [NSMutableDictionary dictionaryWithObject:itemsArray forKey:@"data"];
        [itemsArrayDict setValue:@"Future" forKey:@"title"];
        [groups addObject:[itemsArrayDict copy]];
    }
    
    self.title = @"Dashboard";
    //self.view.backgroundColor = [UIColor clearColor];
    //self.view.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.477 blue: 1.0 alpha:1.0];
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    /* navigation bar button button */
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
    
    //testing global stuff
    //obj.str= @"I am Global variable";

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
    return [groups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[groups objectAtIndex:section] objectForKey:@"data"] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width, 30)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,0,tableView.frame.size.width - 40, 30)];
    [header addSubview:headerLabel];
    
    header.backgroundColor = [UIColor colorWithRed:132.0/255.0 green:196.0/255.0 blue:64.0/255.0 alpha:1.0];
    headerLabel.textColor = [UIColor whiteColor];
    
    [headerLabel setText:[[groups objectAtIndex:section] objectForKey:@"title"]];
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SmallCell";
    UITableViewCell *cell;
    
    Meeting *meet = [[[groups objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"LargeCell"/* forIndexPath:indexPath*/];
        
        UILabel *dateLabel = (UILabel *)[cell viewWithTag:2];
        UILabel *timeLabel = (UILabel *)[cell viewWithTag:3];
        UILabel *companyLabel = (UILabel *)[cell viewWithTag:4];
        UILabel *addressLabel = (UILabel *)[cell viewWithTag:5];
        UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:6];
        
        //stuff for current date
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"EEE MMM dd yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        
        //tomorrow's date
        NSString *tDate = [dateFormatter stringFromDate:[currDate dateByAddingTimeInterval:60*60*24]];
        
        
        //stuff for stored date and time
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEE MMM dd yyyy"];
        NSString *stringFromDate = [formatter stringFromDate:meet.date];
        [formatter setDateFormat:@"HH:mm a"];
        NSString *time = [formatter stringFromDate:meet.date];
        
        //figure out if the date is today or tomorrow only.
        if([stringFromDate isEqualToString:dateString])
            dateLabel.text = @"Today";
        else if ([dateString isEqualToString:tDate])
            dateLabel.text = @"Tomorrow";
        else
            dateLabel.text = stringFromDate;
        
        
        timeLabel.text = time;
        
        companyLabel.text = meet.company;
        addressLabel.text = meet.address;
        descriptionLabel.text = meet.description;
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    }
    
   
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    
    nameLabel.text = meet.name;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 200;
        
    } else {
        return 50.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}


// Called when you click on an item in the search results
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Create a new meeting page, using the identifier defined in Storyboard
    MeetingTabBarController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetingTabBar"];
    stubController.view.backgroundColor = [UIColor whiteColor];
    
    Meeting *meet = [[[groups objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row];
    stubController.title = meet.name;
    stubController.meeting = meet;
    
    // Add the swipe gestures. I couldn't figure out a way to add those in the tab bar controller because it does not have
    // a reference to revealViewController
    [stubController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Push the new meeting page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:YES];
    
}


@end
