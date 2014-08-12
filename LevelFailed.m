//
//  LevelFailed.m
//  Brainalysis
//
//  Created by aaron on 6/6/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "LevelFailed.h"
#import "MainLevelView.h"
#import <QuartzCore/QuartzCore.h>

@interface LevelFailed ()

@end

@implementation LevelFailed

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
    self.similarityLabel.text = [NSString stringWithFormat:@"You were %.0f%% of the way there!", similarity];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.homeButton.layer.cornerRadius = 8;
    self.homeButton.clipsToBounds = YES;
    [self.tryAgainButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.tryAgainButton.layer.cornerRadius = 8;
    self.tryAgainButton.clipsToBounds = YES;
    
    self.textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.textView.layer.cornerRadius = 8;
    
    //Set up navigation bar items
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"HOME"
                                                                   style:UIBarButtonItemStyleBordered target:self action:@selector(homeButtonPress:)];
    self.navigationItem.leftBarButtonItem = backButton;
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryAgainButtonPress:(id)sender {
    [self.delegate restartLevel:level];
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)homeButtonPress:(id)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
