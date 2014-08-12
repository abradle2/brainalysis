//
//  OpeningView.h
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpeningView : UIViewController

- (IBAction)homeButtonPress:(id)sender;
- (IBAction)goButtonPress:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *mainText;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UIView *textView;

@end