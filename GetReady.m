//
//  GetReady.m
//  Brainalysis
//
//  Created by aaron on 6/6/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "GetReady.h"

@interface GetReady ()

@end

@implementation GetReady

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
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removeView:) userInfo:NULL repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)removeView:(NSTimer*)theTimer
{
    
    [self.navigationController popViewControllerAnimated:NO ];
}
@end
