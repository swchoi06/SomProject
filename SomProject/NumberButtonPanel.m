//
//  NumberButtonPanel.m
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import "NumberButtonPanel.h"

#import "Constants.h"

@interface NumberButtonPanel (){
}
- (void)buttonClicked:(id)sender;
- (void)setButtonColor:(NumberButton *)button;

@end

@implementation NumberButtonPanel

- (id)initWithOrigin:(int)x y:(int)y{
    self = [super initWithFrame:CGRectMake(x, y, 318, 159)];
    if(self){
        [self buttonGenerator];
    }
    return self;
}

- (void)newGame{
    for(NumberButton * button in [self subviews]){
        if([button isClicked]){
            [button changeState];
        }
        [button randNumber];
        [button randColor];
        [self setButtonColor:button];
        [button setTitle:[NSString stringWithFormat:@"%d", button.number] forState:UIControlStateNormal];
    }
}

- (void)buttonGenerator{
    for(int i=0; i<3; i++){
        for(int j=0; j<6; j++){
            NumberButton * button = [[NumberButton alloc] initWithRandomNumberAndColor];
            button.tag = i*10 + j;
            button.frame = CGRectMake(53*j, 53*i, 53, 53);
            button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [button setUserInteractionEnabled:YES];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
            
            [button setTitle:[NSString stringWithFormat:@"%d", button.number] forState:UIControlStateNormal];
            [self setButtonColor:button];
            [self addSubview:button];
        }
    }
}

- (void)setButtonColor:(NumberButton *)button{
    while (1) {
        BOOL flag = true;
        for(NumberButton * buttons in self.subviews){
            if(buttons.tag == button.tag+1 || buttons.tag == button.tag-1 || buttons.tag == button.tag+10 || buttons.tag == button.tag-10){
                if(buttons.color == button.color){
                    flag = false;
                    [button randColor];
                }
            }
        }
        if(flag) break;
    }
    button.backgroundColor = [COLOR objectAtIndex:button.color];
}
- (void)buttonClicked:(id)sender{
    [self.delegate buttonClicked:sender];
}

@end
