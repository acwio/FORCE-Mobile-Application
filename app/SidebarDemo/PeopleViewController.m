//
//  PeopleViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/3/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "PeopleViewController.h"
#import "PersonViewController.h"
#import "SWRevealViewController.h"
#import "DataClass.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

NSMutableArray *people;

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
    
    DataClass *data=[DataClass getInstance];
    people = data.people;

    /* navigation bar button button */
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10.0, 2.0, 25.5, 24.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"Nav_Icon.png"] forState:UIControlStateNormal];
    [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=barBtn;
    /* navigation bar button */
    
    /* search bar button */
    UIButton *btn2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(10.0, 2.0, 25.5, 24.0)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"Search_Magnify_Icon.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self.navigationController.searchDisplayController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    self.navigationItem.rightBarButtonItem=barBtn2;
    /* search bar button */
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *companyLabel = (UILabel *)[cell viewWithTag:4];
    
    Person *person = [people objectAtIndex:indexPath.row];
    
    nameLabel.text = person.name;
    titleLabel.text = person.title;
    companyLabel.text = person.company;
    [imageView setImage:[UIImage imageNamed:person.picURL]];
        
    return cell;
}

// Called when you click on an item in the search results
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Create a new person page, using the identifier defined in Storyboard
    PersonViewController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonViewController"];
    stubController.view.backgroundColor = [UIColor whiteColor];
    
    Person *person = [people objectAtIndex:indexPath.row];
    stubController.title = person.name;
    stubController.person = person;
    
    // Add the swipe gestures. I couldn't figure out a way to add those in the tab bar controller because it does not have
    // a reference to revealViewController
    [stubController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Push the new page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:YES];
    
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
    // Pass the selected object to the new view controller.
}

 */

@end
