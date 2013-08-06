//
//  NumberButton.h
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberButton : UIButton

@property (nonatomic) int number;
@property (nonatomic) int color;

-(id)initWithRandomNumberAndColor;
-(BOOL)isClicked;
-(void)changeState;
-(void)randNumber;
-(void)randColor;

@end
