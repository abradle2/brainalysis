//
//  OpeningView.m
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "OpeningView.h"
#import "ViewController.h"
#import "MainLevelView.h"
#import <QuartzCore/QuartzCore.h>

@interface OpeningView ()

@end

@implementation OpeningView

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
    [self.mainText setEditable:NO];
    self.mainText.text = @"When the level begins, a series of buttons become highlighted, one by one. During this time, just pay attention. When the large 'GO' appears on the screen, replicate the pattern to the best of your ability.  You must reproduce it exactly before you can move on to the next level. You are welcome to try any given level on Easy, Medium, or Hard difficulty. \n\n Increase your Brain Quotient by progressing through the levels.";
    self.textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.textView.layer.cornerRadius = 8;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.homeButton.layer.cornerRadius = 8;
    self.homeButton.clipsToBounds = YES;
    [self.goButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.goButton.layer.cornerRadius = 8;
    self.goButton.clipsToBounds = YES;
    
    //Set up navigation bar buttons
    UIBarButtonItem *restartButton = [[UIBarButtonItem alloc] initWithTitle:@"RESTART" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = restartButton;
     
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"HOME" style:UIBarButtonItemStylePlain target:self action:@selector(homeButtonPress:)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeButtonPress:(id)sender
{
    /*
    UIStoryboard *iphoneStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ViewController *homeView = [iphoneStoryboard instantiateViewControllerWithIdentifier:@"homeView"];
    [self.navigationController pushViewController:homeView animated:YES];
     */
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)goButtonPress:(id)sender
{
    MainLevelView *mainLevelView = [[MainLevelView alloc]initWithNibName:@"MainLevelView" bundle:nil];
    [self.navigationController pushViewController:mainLevelView animated:YES];
}
@end
