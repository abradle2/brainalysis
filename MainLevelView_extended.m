//
//  MainLevelView_extended.m
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "MainLevelView_extended.h"


#define colorArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_brown_up.png"], [UIImage imageNamed:@"button_white_up.png"], [UIImage imageNamed:@"button_grey_up.png"], [UIImage imageNamed:@"button_teal_up.png"], [UIImage imageNamed:@"button_black_up.png"], [UIImage imageNamed:@"button_orange_up.png"], [UIImage imageNamed:@"button_pink_up.png"], [UIImage imageNamed:@"button_purple_up.png"], [UIImage imageNamed:@"button_yellow_up.png"], [UIImage imageNamed:@"button_green_up.png"], [UIImage imageNamed:@"button_blue_up.png"], [UIImage imageNamed:@"button_red_up.png"], nil]

#define colorDownArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_brown_down.png"], [UIImage imageNamed:@"button_white_down.png"], [UIImage imageNamed:@"button_grey_down.png"], [UIImage imageNamed:@"button_teal_down.png"], [UIImage imageNamed:@"button_black_down.png"], [UIImage imageNamed:@"button_orange_down.png"], [UIImage imageNamed:@"button_pink_down.png"], [UIImage imageNamed:@"button_purple_down.png"], [UIImage imageNamed:@"button_yellow_down.png"], [UIImage imageNamed:@"button_green_down.png"], [UIImage imageNamed:@"button_blue_down.png"], [UIImage imageNamed:@"button_red_down.png"], nil]

#define numberWhiteArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_1_white.png"], [UIImage imageNamed:@"button_2_white.png"], [UIImage imageNamed:@"button_3_white.png"], [UIImage imageNamed:@"button_4_white.png"], [UIImage imageNamed:@"button_5_white.png"], [UIImage imageNamed:@"button_6_white.png"], [UIImage imageNamed:@"button_7_white.png"], [UIImage imageNamed:@"button_8_white.png"], [UIImage imageNamed:@"button_9_white.png"], [UIImage imageNamed:@"button_10_white.png"], [UIImage imageNamed:@"button_11_white.png"], [UIImage imageNamed:@"button_12_white.png"], nil]

#define numberBlackArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_1_black.png"], [UIImage imageNamed:@"button_2_black.png"], [UIImage imageNamed:@"button_3_black.png"], [UIImage imageNamed:@"button_4_black.png"], [UIImage imageNamed:@"button_5_black.png"], [UIImage imageNamed:@"button_6_black.png"], [UIImage imageNamed:@"button_7_black.png"], [UIImage imageNamed:@"button_8_black.png"], [UIImage imageNamed:@"button_9_black.png"], [UIImage imageNamed:@"button_10_black.png"], [UIImage imageNamed:@"button_11_black.png"], [UIImage imageNamed:@"button_12_black.png"], nil]

#define letterRoundUpArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_round_a_up.png"], [UIImage imageNamed:@"button_round_b_up.png"], [UIImage imageNamed:@"button_round_c_up.png"], [UIImage imageNamed:@"button_round_f_up.png"], [UIImage imageNamed:@"button_round_g_up.png"], [UIImage imageNamed:@"button_round_j_up.png"], [UIImage imageNamed:@"button_round_k_up.png"], [UIImage imageNamed:@"button_round_L_up.png"], [UIImage imageNamed:@"button_round_p_up.png"], [UIImage imageNamed:@"button_round_r_up.png"], [UIImage imageNamed:@"button_round_t_up.png"], [UIImage imageNamed:@"button_round_v_up.png"], nil]

#define letterRoundDownArray [NSArray arrayWithObjects:[UIImage imageNamed:@"button_round_a_down.png"], [UIImage imageNamed:@"button_round_b_down.png"], [UIImage imageNamed:@"button_round_c_down.png"], [UIImage imageNamed:@"button_round_f_down.png"], [UIImage imageNamed:@"button_round_g_down.png"], [UIImage imageNamed:@"button_round_j_down.png"], [UIImage imageNamed:@"button_round_k_down.png"], [UIImage imageNamed:@"button_round_l_down.png"], [UIImage imageNamed:@"button_round_p_down.png"], [UIImage imageNamed:@"button_round_r_down.png"], [UIImage imageNamed:@"button_round_t_down.png"], [UIImage imageNamed:@"button_round_v_down.png"], nil]

#define letterYellowUpArray [NSArray arrayWithObjects:[UIImage imageNamed:@"buttonYellowAUp.png"], [UIImage imageNamed:@"buttonYellowBUp.png"], [UIImage imageNamed:@"buttonYellowCUp.png"], [UIImage imageNamed:@"buttonYellowFUp.png"], [UIImage imageNamed:@"buttonYellowGUp.png"], [UIImage imageNamed:@"buttonYellowJUp.png"], [UIImage imageNamed:@"buttonYellowKUp.png"], [UIImage imageNamed:@"buttonYellowLUp.png"], [UIImage imageNamed:@"buttonYellowPUp.png"], [UIImage imageNamed:@"buttonYellowRUp.png"], [UIImage imageNamed:@"buttonYellowTUp.png"], [UIImage imageNamed:@"buttonYellowVUp.png"], nil]

#define letterYellowDownArray [NSArray arrayWithObjects:[UIImage imageNamed:@"buttonYellowADown.png"], [UIImage imageNamed:@"buttonYellowBDown.png"], [UIImage imageNamed:@"buttonYellowCDown.png"], [UIImage imageNamed:@"buttonYellowFDown.png"], [UIImage imageNamed:@"buttonYellowGDown.png"], [UIImage imageNamed:@"buttonYellowJDown.png"], [UIImage imageNamed:@"buttonYellowKDown.png"], [UIImage imageNamed:@"buttonYellowLDown.png"], [UIImage imageNamed:@"buttonYellowPDown.png"], [UIImage imageNamed:@"buttonYellowRDown.png"], [UIImage imageNamed:@"buttonYellowTDown.png"], [UIImage imageNamed:@"buttonYellowVDown.png"], nil]

@implementation MainLevelView (extended)

- (NSMutableArray*)generateRandomNums:(int)length
{
    //Generates an NSMutableArray with random, distinct numbers
    NSMutableArray *randomNumberArray;
    randomNumberArray = [[NSMutableArray alloc]init];
    for (int i=0; i<length; i++)
    {
        [randomNumberArray addObject:[NSNumber numberWithInt:i]];
    }
    for (int i=0; i<[randomNumberArray count]; i++)
    {
        int nElements = [randomNumberArray count]-i;
        int n = (arc4random() % nElements) +i;
        [randomNumberArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return randomNumberArray;
}

- (void)level1
{
    level = 1;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];

    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberWhiteArray objectAtIndex:j]];
        [button setImage:[numberBlackArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 3;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 4;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 5;
        [self generateReference:&numValues];
    }
    else
    {
        //If for some reason difficulty isn't set at this point, set it to 0 (easy)
        [defaults setObject:[NSNumber numberWithInt:0] forKey:@"difficulty"];
        NSInteger numValues = 3;
        [self generateReference:&numValues];
    }
}

- (void)level2
{
    level = 2;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 4;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 5;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 6;
        [self generateReference:&numValues];
    }

}

- (void)level3
{
    level = 3;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberWhiteArray objectAtIndex:j]];
        [button setImage:[numberBlackArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 5;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 7;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 8;
        [self generateReference:&numValues];
    }
}

- (void)level4
{
    level = 4;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberWhiteArray objectAtIndex:j]];
        [button setImage:[numberBlackArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 6;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 7;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 9;
        [self generateReference:&numValues];
    }
}

- (void)level5
{
    level = 5;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[letterYellowUpArray objectAtIndex:j]];
        [button setImage:[letterYellowDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 6;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 8;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 10;
        [self generateReference:&numValues];
    }
}

- (void)level6
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 6;
    
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 7;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 9;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 10;
        [self generateReference:&numValues];
    }
}

- (void)level7
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 7;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberWhiteArray objectAtIndex:j]];
        [button setImage:[numberBlackArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 8;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 10;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 12;
        [self generateReference:&numValues];
    }
}

- (void)level8
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 8;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[letterYellowUpArray objectAtIndex:j]];
        [button setImage:[letterYellowDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 8;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 11;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
}

- (void)level9
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 9;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 9;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 12;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
}

- (void)level10
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 10;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 7;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 9;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 9;
        [self generateReference:&numValues];
    }
}

- (void)level11
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 11;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberBlackArray objectAtIndex:j]];
        [button setImage:[numberWhiteArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 10;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 15;
        [self generateReference:&numValues];
    }
}

- (void)level12
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 12;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 11;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 16;
        [self generateReference:&numValues];
    }
}

- (void)level13
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 13;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        if(j < 6)
        {
            [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
            [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
        else
        {
            [self setButtonAppearance:button imageName:[numberWhiteArray objectAtIndex:j]];
            [button setImage:[numberBlackArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 12;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 14;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 17;
        [self generateReference:&numValues];
    }
}

- (void)level14
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 14;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        if(j > 6)
        {
            [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
            [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
        else
        {
            [self setButtonAppearance:button imageName:[letterYellowUpArray objectAtIndex:j]];
            [button setImage:[letterYellowDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 11;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 18;
        [self generateReference:&numValues];
    }
}

- (void)level15
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 15;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberBlackArray objectAtIndex:j]];
        [button setImage:[numberWhiteArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 16;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 19;
        [self generateReference:&numValues];
    }
}

- (void)level16
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 16;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 12;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 18;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 20;
        [self generateReference:&numValues];
    }
}

- (void)level17
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 17;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
        [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 11;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 19;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 21;
        [self generateReference:&numValues];
    }
}

- (void)level18
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 18;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        if(j < 6)
        {
            [self setButtonAppearance:button imageName:[colorArray objectAtIndex:j]];
            [button setImage:[colorDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
        else
        {
            [self setButtonAppearance:button imageName:[letterYellowUpArray objectAtIndex:j]];
            [button setImage:[letterYellowDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
        }
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 12;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 20;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 23;
        [self generateReference:&numValues];
    }
}

- (void)level19
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 17;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[letterYellowUpArray objectAtIndex:j]];
        [button setImage:[letterYellowDownArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 10;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 20;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 25;
        [self generateReference:&numValues];
    }
}

- (void)level20
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger difficulty = [[defaults objectForKey:@"difficulty"]integerValue];
    
    //-----CHANGE HERE-----
    level = 20;
    //Make sure the next two lines both refer to the same # (ie 12)
    NSMutableArray *temp_randomNumberArray = [self generateRandomNums:12];
    for (int i=0; i<12; i++)
    {
        //Set up buttons
        UIButton *button = [buttonArray objectAtIndex:i];
        int j = [[temp_randomNumberArray objectAtIndex:i] integerValue];
        [button setTitle:[NSString stringWithFormat:@"%d", j] forState:UIControlStateNormal];
        
        //-----CHANGE HERE-----
        [self setButtonAppearance:button imageName:[numberBlackArray objectAtIndex:j]];
        [button setImage:[numberWhiteArray objectAtIndex:j] forState:UIControlStateHighlighted];
    }
    //Generate referenceArray and show it
    
    //-----CHANGE HERE-----
    if (difficulty == 0)
    {
        NSInteger numValues = 13;
        [self generateReference:&numValues];
    }
    else if (difficulty == 1)
    {
        NSInteger numValues = 24;
        [self generateReference:&numValues];
    }
    else if (difficulty == 2)
    {
        NSInteger numValues = 30;
        [self generateReference:&numValues];
    }
}


@end