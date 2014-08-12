//
//  AboutView.m
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "AboutView.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutView ()

@end

@implementation AboutView

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
    [self.aboutTextBox setEditable:NO];
    self.aboutTextBox.text = @"Brainalyzer was designed and built by Aaron Bradley, a graduate student in physics at the University of California, Berkeley. \n It has two intended purposes: \n\n 1) Provide a fun distaction from daily life \n 2) Help you to build critical memorization abilities \n\n You can train your brain to see patterns, and the various modes of this game are intended to help you understand how best to train yours. \n\n (C)2013 Aaron Bradley";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.homeButton.layer.cornerRadius = 8;
    self.homeButton.clipsToBounds = YES;
    self.textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.textView.layer.cornerRadius = 8;

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
@end
