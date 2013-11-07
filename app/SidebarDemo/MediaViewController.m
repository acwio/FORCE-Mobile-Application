//
//  MediaViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/2/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//
// http://www.appcoda.com/ios-avfoundation-framework-tutorial/
// http://www.appcoda.com/ios-programming-camera-iphone-app/

#import "MediaViewController.h"
#import "DataClass.h"
#import "File.h"
#import "Meeting.h"
#import "MeetingTabBarController.h"

@interface MediaViewController ()

@end

@implementation MediaViewController

@synthesize recordButton, meeting;

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)btnSave:(id)sender {
    
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          [NSString stringWithFormat: @"MyImage.jpg"]];
        NSData* data = UIImageJPEGRepresentation(image, 1.0);
        
        [data writeToFile:path atomically:YES];
        
        NSLog(@"meeting array: %@", meeting.files);
        
        DataClass *obj = [DataClass getInstance];
        File *file = [File initWithName:@"New Picture File" path:path];
        [obj.files addObject:file];
        [meeting.files addObject:file];
        
        NSLog(@"saved: %@", path);
        
    }
}

- (IBAction) record
{
    if(!recorder.recording){
    NSError *error;
    
    // Recording settings
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    
    [settings setValue: [NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [settings setValue: [NSNumber numberWithFloat:8000.0] forKey:AVSampleRateKey];
    [settings setValue: [NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
    [settings setValue: [NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    [settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
    [settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    [settings setValue:  [NSNumber numberWithInt: AVAudioQualityMax] forKey:AVEncoderAudioQualityKey];
    
    NSArray *searchPaths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath_ = [searchPaths objectAtIndex: 0];
    
    pathToSave = [documentPath_ stringByAppendingPathComponent:[self dateString]];
    
    // File URL
    NSURL *url = [NSURL fileURLWithPath:pathToSave];//FILEPATH];
    
    
    //Save recording path to preferences
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    [prefs setURL:url forKey:@"Test1"];
    [prefs synchronize];
    
    
    // Create recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    
    [recorder prepareToRecord];
    
    [recorder record];
    }
    else{
        [recorder stop];
        
        NSLog(@"%@", pathToSave);
        
        DataClass *obj = [DataClass getInstance];
        File *file = [File initWithName:@"New Audio File" path:pathToSave];
        [obj.files addObject:file];
        [meeting.files addObject:file];
    }
}


-(IBAction)playBack
{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    
    
    //Load recording path from preferences
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    temporaryRecFile = [prefs URLForKey:@"Test1"];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:temporaryRecFile error:nil];
    
    player.delegate = self;
    
    [player setNumberOfLoops:0];
    player.volume = 1;
    
    [player prepareToPlay];
    [player play];
}



- (NSString *) dateString
{
    // return a formatted string for a file name
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"ddMMMYY_hhmmssa";
    return [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".aif"];
}

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [recordButton setTitle:@"Record" forState:UIControlStateNormal];
}

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
    self.meeting = ((MeetingTabBarController *)self.tabBarController).meeting;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    [audioSession setActive:YES error:nil];
    
    [recorder setDelegate:self];
    
    //[self loadImage];
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
