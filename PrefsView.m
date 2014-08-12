//
//  PrefsView.m
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "PrefsView.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PrefsView ()

@end

@implementation PrefsView
{

    NSArray *difficultyData;
    NSArray *displayData;
    NSArray *sectionHeaders;
    int selectedIndexRow;
    int selectedIndexSection;
    NSUserDefaults *defaults;
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
    //Set up navigation bar items
    UIImage *homeButtonImage = [[UIImage imageNamed:@"homeButtonTransparent.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:homeButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.labelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
    self.labelView.layer.cornerRadius = 8;
    [self.labelView setContentSize:CGSizeMake(280, 500)];
    
    difficultyData = [NSArray arrayWithObjects:@"Easy", @"Medium", @"Hard", nil];
    displayData = [NSArray arrayWithObjects:@"BUTTON PRESSES", @"ALL AT ONCE", @"SPOKEN", nil];
    sectionHeaders = [NSArray arrayWithObjects:@"DIFFICULTY", @"DISPLAY MODE", nil];
    
    defaults = [NSUserDefaults standardUserDefaults];
    selectedIndexRow = 10;      //kludge - set to a value larger than the last row
    selectedIndexSection = 10;  //kludge - set to a value larger than the last section

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [sectionHeaders count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [difficultyData count];
    }
    else if (section == 1)
    {
        return [displayData count];
    }
    else
    {
        return 0;
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionHeaders objectAtIndex:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    headerLabel.text = [sectionHeaders objectAtIndex:section];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor grayColor];
    headerLabel.shadowOffset = CGSizeMake(0,1);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.alpha = 0.9;
    return headerLabel;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleCell"];
     if (cell == nil)
     {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"simpleCell"];
     }
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [difficultyData objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        //Change following if statement when you get other display modes set up
        if(indexPath.row !=0)
        {
            cell.userInteractionEnabled = NO;
        }
        cell.textLabel.text = [displayData objectAtIndex:indexPath.row];
    }
     cell.textLabel.textColor = [UIColor whiteColor];
     cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
    av.backgroundColor = [UIColor clearColor];
    av.opaque = NO;
    av.image = [UIImage imageNamed:@"buttonMainMenu.png"];
    cell.backgroundView = av;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    //Set checkmarks for previously saved preferences
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    if (indexPath.section == 0 && indexPath.row == difficulty)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    NSInteger displayMode = [[defaults objectForKey:@"displayMode"]integerValue];
    if (indexPath.section == 1 && indexPath.row == displayMode)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
     
    
    //Alow only one selection per section, and save that selection to user defaults
    if(indexPath.row == selectedIndexRow && indexPath.section == selectedIndexSection)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        if (selectedIndexSection == 0)
        {
            //0 == easy
            //1 == medium
            //2 == hard
            [defaults setObject:[NSNumber numberWithInt: selectedIndexRow] forKey:@"difficulty"];
            [defaults synchronize];
        }
        else if(selectedIndexSection == 1)
        {
            //0 == button pressed
            //1 == all at once
            //2 == spoken
            [defaults setObject:[NSNumber numberWithInt: selectedIndexRow] forKey:@"displayMode"];
            [defaults synchronize];
        }
    }
    else if(indexPath.section == selectedIndexSection)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.layer.cornerRadius = 8.0;
    [tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndexRow = indexPath.row;
    selectedIndexSection = indexPath.section;
    [tableView reloadData];
    
    //Change this for adding multiple options to table view
    if (indexPath.section == 0 && indexPath.row ==1) {
            }
    if (indexPath.section == 0 && indexPath.row ==2) {
        }
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (IBAction)homeButtonPress:(id)sender
{
    //Not currently used, but kept around in case we need it later
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
