//
//  AboutView.h
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutView : UIViewController

- (IBAction)homeButtonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextBox;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIView *textView;


@end
