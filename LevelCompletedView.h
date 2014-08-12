//
//  LevelCompletedView.h
//  Brainalysis
//
//  Created by aaron on 6/4/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@class LevelCompletedView;
@protocol LevelCompletedViewDelegate <NSObject>
@required
- (void)newLevel:(NSInteger)levelVal;

@end

@interface LevelCompletedView : UIViewController <ADBannerViewDelegate>
{
    id <LevelCompletedViewDelegate> _delegate;
    ADBannerView *adBanner1;
}
@property (retain) id <LevelCompletedViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *readyLabel;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UIView *textView;

- (IBAction)goButtonPress:(id)sender;
- (IBAction)homeButtonPress:(id)sender;
- (IBAction)settingsButtonPress:(id)sender;

@property (nonatomic, assign)BOOL adBanner1IsVisible;
@property (weak, nonatomic) IBOutlet ADBannerView *adBanner1;

@end


