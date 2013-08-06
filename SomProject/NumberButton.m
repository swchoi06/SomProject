//
//  NumberButton.m
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import "NumberButton.h"
#import "Constants.h"

@implementation NumberButton{
    BOOL clicked;
}

@synthesize number, color;

-(id)initWithRandomNumberAndColor{
    self = [super init];
    if(self){
        [self randNumber];
        [self randColor];
        clicked = NO;
    }
    return self;
}


- (BOOL)isClicked{
    return clicked;
}

- (void)changeState{
    if(clicked){
        clicked = NO;
        self.alpha = 1.0;
    }else{
        clicked = YES;
        self.alpha = 0.5;
    }
}

- (void)randColor{
    self.color = arc4random() %4;
}
-(void)randNumber{
    self.number = arc4random() % 10;
    [self setTitle:[NSString stringWithFormat:@"%d", self.number] forState:UIControlStateNormal];
}

@end
