//
//  PrefsView.h
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefsView : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *labelView;


- (IBAction)homeButtonPress:(id)sender;

@end
