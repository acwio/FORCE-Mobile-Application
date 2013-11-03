//
//  FilesViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/3/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "FilesViewController.h"
#import "SWRevealViewController.h"
#import "DataClass.h"

@interface FilesViewController ()

@end

@implementation FilesViewController

@synthesize tableView;

NSArray *files;
NSMutableArray *groups;
BOOL group = false;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataClass *data=[DataClass getInstance];
    files = [data.files sortedArrayUsingComparator:^(File *m1, File *m2) {
        return [[m1 name] compare:[m2 name]];
    }];
    
    groups = [[NSMutableArray alloc] init];
    
    NSPredicate *documentPredicate = [NSPredicate predicateWithFormat:@"path contains[cd] '.pdf'"];
    NSPredicate *imagePredicate = [NSPredicate predicateWithFormat:@"path contains[cd] '.jpg'"];
    
    NSArray *firstItemsArray = [files filteredArrayUsingPredicate:documentPredicate];
    NSMutableDictionary *firstItemsArrayDict = [NSMutableDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
    [firstItemsArrayDict setValue:@"Documents" forKey:@"title"];
    [groups addObject:firstItemsArrayDict];
    
    //Second section data
    NSArray *secondItemsArray = [files filteredArrayUsingPredicate:imagePredicate];
    NSMutableDictionary *secondItemsArrayDict = [NSMutableDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
    [secondItemsArrayDict setValue:@"Images" forKey:@"title"];
    [groups addObject:secondItemsArrayDict];
    
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
    
    if (group) {
        return [groups count];
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (group) {
        return [[[groups objectAtIndex:section] objectForKey:@"data"] count];
    } else {
        return [files count];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (!group) {
        return nil;
    }
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width, 30)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:header.bounds];
    [header addSubview:headerLabel];
    
    header.backgroundColor = [UIColor colorWithRed:132.0/255.0 green:196.0/255.0 blue:64.0/255.0 alpha:1.0];
    headerLabel.textColor = [UIColor whiteColor];
    
    [headerLabel setText:[[groups objectAtIndex:section] objectForKey:@"title"]];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (group) {
        return 30.0;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (group) {
        cell.textLabel.text = [[[[groups objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row] name];
    } else {
        File *file = [files objectAtIndex:indexPath.row];
        cell.textLabel.text = file.name;
    }
    
    return cell;
}

// Called when you click on a file
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create a UIView and Controller to display the file
    UIViewController *webViewController = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc]  initWithFrame:CGRectMake(0, 0, 320, 568)];
    [webView setScalesPageToFit:YES];
    [webViewController.view addSubview:webView];
    
    File *file = [files objectAtIndex:indexPath.row];
    
    webViewController.title = file.name;
    
    // Find the url of the file and load into the webview
    NSString *path = [[NSBundle mainBundle] pathForResource:file.path ofType:nil];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    // Push the new page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:webViewController animated:YES];
    
}

- (IBAction)toggleGroup:(id)sender {
    group = !group;
    [tableView reloadData];
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
