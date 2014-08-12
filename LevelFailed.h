//
//  LevelFailed.h
//  Brainalysis
//
//  Created by aaron on 6/6/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LevelFailed;
@protocol LevelFailedDelegate <NSObject>

- (void)restartLevel:(NSInteger)levelVal;

@end

@interface LevelFailed : UIViewController
{
    id <LevelFailedDelegate> _delegate;
}
@property (retain) id <LevelFailedDelegate> delegate;

- (IBAction)tryAgainButtonPress:(id)sender;
- (IBAction)homeButtonPress:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *similarityLabel;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;


@end
