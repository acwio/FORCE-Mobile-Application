//
//  SearchViewController.m
//  FORCE
//
//  Created by Nathan Reale on 10/30/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "SWRevealViewController.h"
#import "SearchViewController.h"
#import "MeetingTabBarController.h"
#import "DataClass.h"
#import "Meeting.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

DataClass *data;
NSArray *meetingResults;
NSArray *peopleResults;
NSArray *fileResults;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* references the SAME obj.str declared in the MainViewController */
    data=[DataClass getInstance];
    
    //self.edgesForExtendedLayout=UIRectEdgeNone;
    //self.extendedLayoutIncludesOpaqueBars=NO;
    //self.automaticallyAdjustsScrollViewInsets=NO;
    self.tableView.frame = CGRectMake(60, 0, 260,900);
    
    self.searchDisplayController.searchBar.tintColor = [UIColor whiteColor];
    //self.tableView.frame = CGRectMake(60, 20, 260,900);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    controller.searchBar.showsCancelButton = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tableView.frame = CGRectMake(60, 0, 260,900);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView != self.searchDisplayController.searchResultsTableView) {
        return 0;
    } else {
        return 3;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView != self.searchDisplayController.searchResultsTableView) {
        return 0;
    }
    
    switch (section) {
        case 0: return [meetingResults count];
        case 1: return [peopleResults count];
        case 2: return [fileResults count];
        default: return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width, 30)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:header.bounds];
    [header addSubview:headerLabel];
    
    switch (section) {
        case 0:
            [headerLabel setText:@"\tMeetings"];
            break;
        case 1:
            [headerLabel setText:@"\tPeople"];
            break;
        case 2:
            [headerLabel setText:@"\tFiles"];
            break;
    }
    [headerLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18.0]];
    headerLabel.backgroundColor = [UIColor colorWithRed:131.0/255.0 green:194.0/255.0 blue:62.0/255.0 alpha:1.0 ];
    headerLabel.textAlignment = UITextAlignmentLeft;
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView != self.searchDisplayController.searchResultsTableView) {
        return cell;
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[meetingResults objectAtIndex:indexPath.row] name];
            break;
        case 1:
            cell.textLabel.text = [[peopleResults objectAtIndex:indexPath.row] name];
            break;
        case 2:
            cell.textLabel.text = [[fileResults objectAtIndex:indexPath.row] name];
            break;
    }
    
    cell.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    cell.textLabel.textAlignment = UITextAlignmentRight;
    
    for (UIView *subview in self.searchDisplayController.searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
    }
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"name contains[cd] %@",
                                    searchText];
    
    meetingResults = [data.meetings filteredArrayUsingPredicate:resultPredicate];
    peopleResults = [data.people filteredArrayUsingPredicate:resultPredicate];
    fileResults = [data.files filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}

// Called when you click on an item in the search results
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView != self.searchDisplayController.searchResultsTableView) {
        return;
    }
    
    // Create a new meeting page, using the identifier defined in Storyboard
    MeetingTabBarController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetingTabBar"];
    stubController.view.backgroundColor = [UIColor whiteColor];
    
    // Set the title depending on if there was a search or not
    if (indexPath.section != 0) {
        return;
    }
    
    Meeting *meet;
    meet = [meetingResults objectAtIndex:indexPath.row];
    stubController.title = meet.name;
    stubController.meeting = meet;
    
    // Add the swipe gestures. I couldn't figure out a way to add those in the tab bar controller because it does not have
    // a reference to revealViewController
    [stubController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Push the new meeting page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:NO];
    
    // Hide the search bar (it saves your search)
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
 };
*/


@end
