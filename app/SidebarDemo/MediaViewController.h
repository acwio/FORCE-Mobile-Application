//
//  MediaViewController.h
//  FORCE
//
//  Created by Nathan Reale on 11/2/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Meeting.h"

@interface MediaViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioSessionDelegate, AVAudioRecorderDelegate> {
    
    AVAudioRecorder *recorder;
    NSURL *temporaryRecFile;
    AVAudioPlayer *player;
 
    NSString *pathToSave;
    
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;
    IBOutlet UIImageView *imageView;
    Meeting *meeting;
}

@property (nonatomic, strong) Meeting *meeting;

-(IBAction)TakePhoto;
-(IBAction)ChooseExisting;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnLoad:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;

- (IBAction)takePhoto:(id)sender;

@end
