//
//  MainLevelView.m
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "MainLevelView.h"
#import "MainLevelView_extended.h"
#import "ViewController.h"
#import "PrefsView.h"
#import "GetReady.h"
#import "LevelCompletedView.h"
#import "LevelFailed.h"
#import <QuartzCore/QuartzCore.h>

@interface MainLevelView ()

@end

@implementation MainLevelView

NSMutableArray *referenceArray;
NSMutableArray *entryArray;
NSInteger loopIter = 0;
NSInteger stop = 0;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom Initialization Goes Here
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
    [self.restartButton setBackgroundImage:[UIImage imageNamed:@"buttonMainMenu.png"] forState:UIControlStateNormal];
    self.restartButton.layer.cornerRadius = 8;
    self.restartButton.clipsToBounds = YES;
    
    
    //Set up navigation bar items
    UIBarButtonItem *restartButton = [[UIBarButtonItem alloc] initWithTitle:@"RESTART" style:UIBarButtonItemStylePlain target:self action:@selector(restartButtonPress)];
    self.navigationItem.rightBarButtonItem = restartButton;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"HOME"
        style:UIBarButtonItemStyleBordered target:self action:@selector(homeButtonPress:)];
    self.navigationItem.leftBarButtonItem = backButton;
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    
    UIButton *titleButton = [[UIButton alloc]init];
    UIImage *settingsButtonImage = [UIImage imageNamed:@"settingsButton.png"];
    [titleButton addTarget:self action:@selector(settingsButtonPress:) forControlEvents:UIControlEventTouchDown];
    [titleButton setBackgroundImage:settingsButtonImage forState:UIControlStateNormal];
    //CGRect titleButtonFrame = titleButton.frame;
    //titleButtonFrame.size = CGSizeMake(20, 20);
    //titleButton.frame = titleButtonFrame;
    [titleButton setFrame:CGRectMake(0, 0, 20, 20)];

    self.navigationItem.titleView = titleButton;
     
    /*
    UIButton *titleButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    UIImage *settingsButtonImage = [UIImage imageNamed:@"settingsButton.png"];
    [titleButton addTarget:self action:@selector(settingsButtonPress:) forControlEvents:UIControlEventTouchDown];
    [titleButton setBackgroundImage:settingsButtonImage forState:UIControlStateNormal];
    titleButton.center=self.navigationController.navigationBar.center;
    titleButton.center=CGPointMake(titleButton.center.x, self.navigationController.navigationBar.frame.size.height/2);
    [self.navigationController.navigationBar addSubview:titleButton];
     */
    
    
    entryArray = [[NSMutableArray alloc]init];
    enableButtons = 0;
    [self.goLabel setHidden:YES];
    [self.countLabel setHidden:YES];
    
    /////////////Test Parameters /////////////
    //[self level14];
    
    SEL nextLevel = NSSelectorFromString ([NSString stringWithFormat:@"level%d", level]);
    if(level >= 1)
    {
        [self performSelector:nextLevel];
    }
    else
    {
        [self level1];
    }
     

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

- (IBAction)homeButtonPress:(id)sender
{
    UIStoryboard *iphoneStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ViewController *homeView = [iphoneStoryboard instantiateViewControllerWithIdentifier:@"homeView"];
    [self.navigationController pushViewController:homeView animated:YES];
}

- (void)restartButtonPress {
    //[self restartLevel:0];
    MainLevelView *mainLevelView = [[MainLevelView alloc]init];
    [self.navigationController pushViewController:mainLevelView animated:NO];
}

- (IBAction)settingsButtonPress:(id)sender
{
    PrefsView *prefsView = [[PrefsView alloc]initWithNibName:@"PrefsView" bundle:nil];
    [self.navigationController pushViewController:prefsView animated:YES];
}


- (void)setButtonAppearance:(UIButton*)button imageName:(UIImage*)image
{
    button.adjustsImageWhenHighlighted = YES;
    button.layer.cornerRadius = 8;
    button.clipsToBounds = YES;
    [button setImage:image forState:UIControlStateNormal];
}


- (void)generateReference:(NSInteger*)length// interval:(float*)interval
{
    //Reset lots of parmeters
    [referenceArray removeAllObjects];
    [entryArray removeAllObjects];
    [self.countLabel setHidden:YES];
    enableButtons = 0;
    stop = 0;
    referenceArray = [[NSMutableArray alloc]init];
    
    //Generate random numbers to decide which buttons to highlight
    for(int i = 0; i < *length; i++)
    {
        int a = arc4random_uniform(11)+1;
        NSNumber* newVal = [NSNumber numberWithInt:a];
        [referenceArray addObject:newVal];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger displayMode = [[defaults objectForKey:@"displayMode"]integerValue];
    if (displayMode == 0)
    {
        [self displayButtonPress:length];
    }
}

- (void)displayButtonPress:(NSInteger*)length
{
    //use this method when displayMode == button press
    


    ///////////////////////////////////////////////////////////////
    //Enable count label in upper middle of screen
    self.countLabel.text = [NSString stringWithFormat:@"%d", [referenceArray count]];
    [self.countLabel setHidden:NO];
    
    //Send randomArray to buttonHighlight to slowly illuminate the buttons
    for(int i=0; i<[referenceArray count]; i++)
    {
        if (i == (*length-1))
        {
            stop = 1;
        }
        [NSTimer scheduledTimerWithTimeInterval:i+0.5
                                           target:self
                                           selector:@selector(buttonHighlight:)
                                           userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [referenceArray objectAtIndex:i], @"buttonNum",
                                                     [NSNumber numberWithBool:YES], @"highlight",
                                                     [NSNumber numberWithInt:[referenceArray count]], @"length",
                                                     nil]
                                            repeats:NO];
        [NSTimer scheduledTimerWithTimeInterval:i+1.0
                                             target:self
                                           selector:@selector(buttonHighlight:)
                                           userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [referenceArray objectAtIndex:i], @"buttonNum",
                                                     [NSNumber numberWithBool:NO], @"highlight",
                                                     [NSNumber numberWithInt:[referenceArray count]], @"length",
                                                     [NSNumber numberWithInt:stop], @"stop",
                                                     nil]                              
                                            repeats:NO];
    }
    stop = 0;
}

- (void)buttonHighlight:(NSTimer*)theTimer
{
    int digitVal = [[[theTimer userInfo]objectForKey:@"buttonNum"]integerValue];
    int highlightVal = [[[theTimer userInfo]objectForKey:@"highlight"]integerValue];
    int stopVal = [[[theTimer userInfo]objectForKey:@"stop"]integerValue];
    
    
    
    //Loop through the buttons to find which one has the desired label
    for (int i=0; i<[buttonArray count]; i++)
    {
        
        
        [[buttonArray objectAtIndex:i]setUserInteractionEnabled:NO];
        NSInteger buttonVal = [[[buttonArray objectAtIndex:i] titleForState:UIControlStateNormal] intValue]+1;
        if(buttonVal == digitVal)
        {
            if (highlightVal == 1)
            {
                [[buttonArray objectAtIndex:i] setHighlighted:YES];

            }
            else
            {
                [[buttonArray objectAtIndex:i] setHighlighted:NO];
                self.countLabel.text = [NSString stringWithFormat:@"%d", [self.countLabel.text intValue]-1];
                
            }

        if (stopVal == 1)
        {
            [NSTimer scheduledTimerWithTimeInterval:0.0
                                             target:self
                                           selector:@selector(changeGoLabelVisibility:)
                                           userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [NSNumber numberWithInt:1], @"visible",
                                                     nil]
                                            repeats:NO];

            [NSTimer scheduledTimerWithTimeInterval:1.0
                                            target:self
                                            selector:@selector(changeGoLabelVisibility:)
                                            userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                    [NSNumber numberWithInt:0], @"visible",
                                                    nil]
                                            repeats:NO];

            }

        }
    }
        loopIter +=1;

}

- (void)changeGoLabelVisibility:(NSTimer*)theTimer
{
    int value = [[[theTimer userInfo]objectForKey:@"visible"]integerValue];
    if (value == 1)
    {
        [self.goLabel setHidden:NO];
        enableButtons = 1;
        for (int i=0; i<[buttonArray count]; i++)
        {
            [[buttonArray objectAtIndex:i]setUserInteractionEnabled:YES];
        }
        
    }
    else if(value == 0)
    {
        [self.goLabel setHidden:YES];
        [self.countLabel setHidden:NO];
        self.countLabel.text = [NSString stringWithFormat:@"%d", [referenceArray count]-[entryArray count]];

    }
}

- (void)checkEntryArray
{
    self.countLabel.text = [NSString stringWithFormat:@"%d", [referenceArray count]-[entryArray count]];
    similarity = 0;
    if([entryArray count] == [referenceArray count])
    {
        enableButtons = NO;
        //Loop through both arrays
        for (int i=0; i<[referenceArray count]; i++)
        {
            //Check if the corresponding values are the same
            if ([referenceArray objectAtIndex:i] == [entryArray objectAtIndex:i])
            {
                similarity +=1;
            }
        }
        similarity = similarity / [referenceArray count]*100;
        
        if(similarity == 100.0)
        {
            //Save the length to NSUserDefaults to keep a running tab on the uer's longest accomplishment
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            //Check difficulty level
            NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
            
            NSNumber *longest = [defaults objectForKey:@"longest"];
            
            NSNumber *highestLevelEasy = [defaults objectForKey:@"highestLevelEasy"];
            NSDate *highestDateEasy = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
            NSNumber *highestLevelMedium = [defaults objectForKey:@"highestLevelMedium"];
            NSDate *highestDateMedium = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
            NSNumber *highestLevelHard = [defaults objectForKey:@"highestLevelHard"];
            NSDate *highestDateHard = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
            
            //Save current level
            [defaults setObject:[NSNumber numberWithInt:(level+1)] forKey:@"currentLevel"];
            
            if([referenceArray count] > [longest integerValue])
            {
                [defaults setObject:[NSNumber numberWithInt:[referenceArray count]] forKey:@"longest"];
            }
            if (difficulty == 0)
            {
                if (level >= [highestLevelEasy integerValue])
                {
                    [defaults setObject:[NSNumber numberWithInt:level] forKey:@"highestLevelEasy"];
                    [defaults setObject:highestDateEasy forKey:@"highestDateEasy"];
                }
            }
            if (difficulty == 1)
            {
                if (level >= [highestLevelMedium integerValue])
                {
                    [defaults setObject:[NSNumber numberWithInt:level] forKey:@"highestLevelMedium"];
                    [defaults setObject:highestDateMedium forKey:@"highestDateMedium"];
                }
            }
            if (difficulty == 2)
            {
                if (level >= [highestLevelHard integerValue])
                {
                    [defaults setObject:[NSNumber numberWithInt:level] forKey:@"highestLevelHard"];
                    [defaults setObject:highestDateHard forKey:@"highestDateHard"];
                }
            }
            
            LevelCompletedView *levelCompletedView = [[LevelCompletedView alloc]init];
            [self.navigationController pushViewController:levelCompletedView animated:NO];
            levelCompletedView.delegate = self;
        }
        else
        {
            LevelFailed *levelFailed = [[LevelFailed alloc]init];
            [self.navigationController pushViewController:levelFailed animated:NO];
            levelFailed.delegate = self;
        }
    }

}


- (IBAction)button1Press:(id)sender {
    
        NSInteger buttonVal = [[_button1 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
    
}

- (IBAction)button2Press:(id)sender {
        NSInteger buttonVal = [[_button2 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
    
}

- (IBAction)button3Press:(id)sender {
        NSInteger buttonVal = [[_button3 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (IBAction)button4Press:(id)sender {
   
        NSInteger buttonVal = [[_button4 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];

}

- (IBAction)button5Press:(id)sender {
        NSInteger buttonVal = [[_button5 titleForState:UIControlStateNormal]    intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
 
}

- (IBAction)button6Press:(id)sender {
        NSInteger buttonVal = [[_button6 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (IBAction)button7Press:(id)sender {
        NSInteger buttonVal = [[_button7 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];

}

- (IBAction)button8Press:(id)sender {

        NSInteger buttonVal = [[_button8 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (IBAction)button9Press:(id)sender {
        NSInteger buttonVal = [[_button9 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
 }

- (IBAction)button10Press:(id)sender {
        NSInteger buttonVal = [[_button10 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (IBAction)button11Press:(id)sender {
        NSInteger buttonVal = [[_button11 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (IBAction)button12Press:(id)sender {
        NSInteger buttonVal = [[_button12 titleForState:UIControlStateNormal] intValue]+1;
        [entryArray addObject:[NSNumber numberWithInt:buttonVal]];
        [self checkEntryArray];
}

- (void)newLevel:(NSInteger)levelVal
{
    SEL nextLevel = NSSelectorFromString ([NSString stringWithFormat:@"level%d", level+1]);
    if(level !=13)
    {
        [self performSelector:nextLevel];
    }
    else
    {
        NSLog(@"Sorry - Haven't built that yet");
    }
}

- (void)restartLevel:(NSInteger)levelVal
{
    
    SEL nextLevel = NSSelectorFromString ([NSString stringWithFormat:@"level%d", level]);
    if(nextLevel !=nil)
    {
        [self performSelector:nextLevel];
    }
     
}
@end








