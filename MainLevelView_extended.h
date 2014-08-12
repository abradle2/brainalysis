//
//  MainLevelView_extended.h
//  Brainalysis
//
//  Created by aaron on 6/5/13.
//  Copyright (c) 2013 aaron. All rights reserved.
//

#import "MainLevelView.h"

//Add a few precompiler directives so this feels like c code
#define buttonArray [NSArray arrayWithObjects:self.button1, self.button2, self.button3, self.button4, self.button5, self.button6, self.button7, self.button8, self.button9, self.button10, self.button11, self.button12, nil]

@interface MainLevelView (extended)

- (NSMutableArray*)generateRandomNums:(int)length;

- (void)level1;
- (void)level2;
- (void)level3;
- (void)level4;
- (void)level5;
- (void)level6;
- (void)level7;
- (void)level8;
- (void)level9;
- (void)level10;
- (void)level11;
- (void)level12;
- (void)level13;
- (void)level14;
@end
