//
//  StatsView.h
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsView : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *highestLevelEasyLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestDateEasyLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestLevelMediumLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestDateMediumLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestLevelHardLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestDateHardLabel;

@property (weak, nonatomic) IBOutlet UILabel *longestLabel;
@property (weak, nonatomic) IBOutlet UILabel *bqLabel;
//@property (weak, nonatomic) IBOutlet UIButton *resetButton;
- (IBAction)resetButtonPress:(id)sender;
- (IBAction)homeButtonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIScrollView *labelView;


@end
