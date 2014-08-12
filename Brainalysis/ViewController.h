//
//  ViewController.h
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)playButtonPress:(id)sender;
- (IBAction)resumeButtonPress:(id)sender;
- (IBAction)statsButtonPress:(id)sender;
- (IBAction)prefsButtonPress:(id)sender;
- (IBAction)aboutButtonPress:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) IBOutlet UIButton *resumeButton;
@property (weak, nonatomic) IBOutlet UIButton *statsButton;
@property (weak, nonatomic) IBOutlet UIButton *prefsButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end
