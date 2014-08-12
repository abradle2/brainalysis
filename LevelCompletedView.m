//
//  LevelCompletedView.m
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "LevelCompletedView.h"
#import "MainLevelView.h"
#import "PrefsView.h"
#import <QuartzCore/QuartzCore.h>
#import <stdlib.h>

@interface LevelCompletedView ()

@end

@implementation LevelCompletedView
@synthesize adBanner1 = _adBanner1;

- (void) bannerViewDidLoadAd:(ADBannerView *)abanner
{
    if (!self.adBanner1IsVisible)
    {
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        //_adBanner1.frame = CGRectOffset(numBanner.frame, 0.0, 416.0);
        _adBanner1.frame = CGRectOffset(_adBanner1.frame, 0.0, -_adBanner1.frame.size.height);
        [UIView commitAnimations];
        self.adBanner1IsVisible = YES;

    }
}

- (void) bannerView:(ADBannerView *)abanner didFailToReceiveAdWithError:(NSError *)error
{
    if (!self.adBanner1IsVisible)
    {
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        _adBanner1.frame = CGRectOffset(_adBanner1.frame, 0.0, 100.0);
        [UIView commitAnimations];
        [self.adBanner1 setHidden:YES];
    }
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    [self.goButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.goButton.layer.cornerRadius = 8;
    self.goButton.clipsToBounds = YES;
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.homeButton.layer.cornerRadius = 8;
    self.homeButton.clipsToBounds = YES;
    
    self.label1.text = [NSString stringWithFormat:@"Level %d Completed", level];
    self.readyLabel.text = [NSString stringWithFormat:@"Get Ready For Level %d", level+1];
    [self.goButton setTitle:[NSString stringWithFormat:@"Start Level %d Now", level+1] forState:UIControlStateNormal];
    self.textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.textView.layer.cornerRadius = 8;
    
    //Set up navigation bar items
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"HOME"
                                                                   style:UIBarButtonItemStyleBordered target:self action:@selector(homeButtonPress:)];
    self.navigationItem.leftBarButtonItem = backButton;
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIButton *titleButton = [[UIButton alloc]init];
    [titleButton addTarget:self action:@selector(settingsButtonPress:) forControlEvents:UIControlEventTouchDown];
    [titleButton setBackgroundImage:[UIImage imageNamed:@"settingsButton20px.png"]forState:UIControlStateNormal];
    [titleButton setFrame:CGRectMake(0, 0, 20, 20)];
    
    self.navigationItem.titleView = titleButton;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settingsButtonPress:(id)sender
{
    PrefsView *prefsView = [[PrefsView alloc]initWithNibName:@"PrefsView" bundle:nil];
    [self.navigationController pushViewController:prefsView animated:YES];
}

- (IBAction)goButtonPress:(id)sender {
    //newLevel method depracated:levelVal argument does nothing!
    [self.delegate newLevel:level+1];
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)homeButtonPress:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
