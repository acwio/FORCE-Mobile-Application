//
//  FilesDetailViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/3/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "FilesDetailViewController.h"
#import "MeetingTabBarController.h"

@interface FilesDetailViewController ()

@end

@implementation FilesDetailViewController

@synthesize meeting;

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
    
    self.meeting = ((MeetingTabBarController *)self.tabBarController).meeting;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [meeting.files count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    File *file = [meeting.files objectAtIndex:indexPath.row];
    
    cell.textLabel.text = file.name;
    
    if ([[file.path pathExtension] isEqualToString:@"jpg"] || [[file.path pathExtension] isEqualToString:@"png"]) {
        cell.imageView.image = [UIImage imageNamed:file.path];
    } else if ([[file.path pathExtension] isEqualToString:@"pdf"]) {
        cell.imageView.image = [UIImage imageNamed:@"pdf-32.png"];
    } else if ([[file.path pathExtension] isEqualToString:@"txt"]) {
        cell.imageView.image = [UIImage imageNamed:@"txt-32.png"];
    }
    
    for (UIView *subview in self.searchDisplayController.searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
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
    
    File *file = [meeting.files objectAtIndex:indexPath.row];
    
    webViewController.title = file.name;
    
    // Find the url of the file and load into the webview
    NSString *path = [[NSBundle mainBundle] pathForResource:file.path ofType:nil];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    // Push the new page on top of the current page
    [(UINavigationController*)self.parentViewController.parentViewController.parentViewController pushViewController:webViewController animated:YES];
    
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
