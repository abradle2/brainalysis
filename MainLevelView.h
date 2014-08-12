//
//  MainLevelView.h
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelCompletedView.h"
#import "LevelFailed.h"
NSInteger level;
double similarity;

@interface MainLevelView: UIViewController <LevelCompletedViewDelegate, LevelFailedDelegate>
{
    NSInteger enableButtons;
    
}

@property (weak, nonatomic) IBOutlet UIView *buttonSubview;


@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;


- (IBAction)homeButtonPress:(id)sender;
- (void)restartButtonPress;
- (IBAction)settingsButtonPress:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;
@property (weak, nonatomic) IBOutlet UIButton *button11;
@property (weak, nonatomic) IBOutlet UIButton *button12;



@property (weak, nonatomic) IBOutlet UILabel *goLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

- (IBAction)button1Press:(id)sender;
- (IBAction)button2Press:(id)sender;
- (IBAction)button3Press:(id)sender;
- (IBAction)button4Press:(id)sender;
- (IBAction)button5Press:(id)sender;
- (IBAction)button6Press:(id)sender;
- (IBAction)button7Press:(id)sender;
- (IBAction)button8Press:(id)sender;
- (IBAction)button9Press:(id)sender;
- (IBAction)button10Press:(id)sender;
- (IBAction)button11Press:(id)sender;
- (IBAction)button12Press:(id)sender;


- (void)generateReference:(NSInteger*)length;
- (void)displayButtonPress:(NSInteger*)length;
- (void)buttonHighlight:(NSTimer*)theTimer;


//Additional Methods
- (void)setButtonAppearance:(UIButton*)button imageName:(UIImage*)image;

@end
