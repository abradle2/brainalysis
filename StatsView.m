//
//  StatsView.m
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "StatsView.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface StatsView ()

@end

@implementation StatsView

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.homeButton.layer.cornerRadius = 8;
    self.homeButton.clipsToBounds = YES;
    
    self.labelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.labelView.layer.cornerRadius = 8;
    [self.labelView setContentSize:CGSizeMake(280, 700)];
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger longest = [[defaults objectForKey:@"longest"]integerValue];
    //Easy
    NSInteger highestLevelEasy = [[defaults objectForKey:@"highestLevelEasy"]integerValue];
    NSDate *highestDateEasy = [defaults objectForKey:@"highestDateEasy"];

    //Medium
    NSInteger highestLevelMedium = [[defaults objectForKey:@"highestLevelMedium"]integerValue];
    NSDate *highestDateMedium = [defaults objectForKey:@"highestDateMedium"];

    //Hard
    NSInteger highestLevelHard = [[defaults objectForKey:@"highestLevelHard"]integerValue];
    NSDate *highestDateHard = [defaults objectForKey:@"highestDateHard"];

    //WORK on definition of BQ
    double bq = (highestLevelEasy*longest)/(longest+1)+100+highestLevelEasy;
    self.bqLabel.text = [NSString stringWithFormat:@"%.1f", bq];
        
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    
    self.highestLevelEasyLabel.text = [NSString stringWithFormat:@"%d", highestLevelEasy];
    self.highestDateEasyLabel.text = [df stringFromDate:highestDateEasy];
    self.highestLevelMediumLabel.text = [NSString stringWithFormat:@"%d", highestLevelMedium];
    self.highestDateMediumLabel.text = [df stringFromDate:highestDateMedium];
    self.highestLevelHardLabel.text = [NSString stringWithFormat:@"%d", highestLevelHard];
    self.highestDateHardLabel.text = [df stringFromDate:highestDateHard];


    self.longestLabel.text = [NSString stringWithFormat:@"%d", longest];
    
    //Set up navigation bar items
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] initWithTitle:@"RESET" style:UIBarButtonItemStylePlain target:self action:@selector(resetButtonPress:)];
    self.navigationItem.rightBarButtonItem = resetButton;

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"HOME"
                                                                   style:UIBarButtonItemStyleBordered target:self action:@selector(homeButtonPress:)];
    self.navigationItem.leftBarButtonItem = backButton;
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeButtonPress:(id)sender
{
    //UIStoryboard *iphoneStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    //ViewController *homeView = [iphoneStoryboard instantiateViewControllerWithIdentifier:@"homeView"];
    //[self.navigationController pushViewController:homeView animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)resetButtonPress:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"highestLevelEasy"];
    [defaults removeObjectForKey:@"highestDateEasy"];
    [defaults removeObjectForKey:@"highestLevelMedium"];
    [defaults removeObjectForKey:@"highestDateMedium"];
    [defaults removeObjectForKey:@"highestLevelHard"];
    [defaults removeObjectForKey:@"highestDateHard"];
    [defaults removeObjectForKey:@"longest"];
    [self viewDidLoad];
    
}
@end
