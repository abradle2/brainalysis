//
//  ViewController.m
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "ViewController.h"
#import "OpeningView.h"
#import "MainLevelView.h"
#import "AboutView.h"
#import "StatsView.h"
#import "PrefsView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    
    //Set buttons
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.playButton.layer.cornerRadius = 8;
    self.playButton.clipsToBounds = YES;
    [self.resumeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.resumeButton.layer.cornerRadius = 8;
    self.resumeButton.clipsToBounds = YES;
    [self.statsButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.statsButton.layer.cornerRadius = 8;
    self.statsButton.clipsToBounds = YES;
    [self.prefsButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.prefsButton.layer.cornerRadius = 8;
    self.prefsButton.clipsToBounds = YES;
    [self.aboutButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.aboutButton.layer.cornerRadius = 8;
    self.aboutButton.clipsToBounds = YES;
    
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"HOME" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *currentLevel = [defaults objectForKey:@"currentLevel"];
    if([currentLevel integerValue] > 1)
    {
        [self.resumeButton setEnabled:YES];
        
    }
    else
    {
        [self.resumeButton setEnabled:NO];
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonPress:(id)sender {
    level = 1;
    OpeningView *openingView = [[OpeningView alloc]initWithNibName:@"OpeningView" bundle:nil];
    [self.navigationController pushViewController:openingView animated:YES];
    
}

- (IBAction)resumeButtonPress:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *currentLevel = [defaults objectForKey:@"currentLevel"];
    level = [currentLevel integerValue];
    
    MainLevelView *mainLevelView = [[MainLevelView alloc]initWithNibName:@"MainLevelView" bundle:nil];
    [self.navigationController pushViewController:mainLevelView animated:YES];
}

- (IBAction)statsButtonPress:(id)sender
{
    StatsView *statsView = [[StatsView alloc]initWithNibName:@"StatsView" bundle:nil];
    [self.navigationController pushViewController:statsView animated:YES];
}

- (IBAction)prefsButtonPress:(id)sender
{
    PrefsView *prefsView = [[PrefsView alloc]initWithNibName:@"PrefsView" bundle:nil];
    [self.navigationController pushViewController:prefsView animated:YES];
}

- (IBAction)aboutButtonPress:(id)sender
{
    AboutView *aboutView = [[AboutView alloc]initWithNibName:@"AboutView" bundle:nil];
    [self.navigationController pushViewController:aboutView animated:YES];
}


@end
