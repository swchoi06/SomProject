//
//  ViewController.m
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NumberButtonPanel * topNumberButtonPanel;
    NumberButtonPanel * bottomNumberButtonPanel;
    
    NSMutableArray * clickedButtons;
}

- (void)buttonClicked:(id)sender;
- (void)goalAchieved;

@end

@implementation ViewController

@synthesize levelLabel, level;
@synthesize goalNumberLabel, goalNumber;
@synthesize sum;


- (void)viewDidLoad
{
    levelLabel.text = @"0";
    level = 0;
    
    //clicked Buttons
    clickedButtons = [[NSMutableArray alloc] init];
    
    // Button Panel.
    topNumberButtonPanel = [[NumberButtonPanel alloc] initWithOrigin:1 y:80];
    topNumberButtonPanel.delegate = self;
    
    bottomNumberButtonPanel = [[NumberButtonPanel alloc] initWithOrigin:1 y:self.view.frame.size.height-159 -1];
    bottomNumberButtonPanel.delegate = self;
    
    [self.view addSubview:topNumberButtonPanel];
    [self.view addSubview:bottomNumberButtonPanel];
    
    [self newGame];
    
    [super viewDidLoad];
}

-(void)buttonClicked:(id)sender{
    NumberButton * button = (NumberButton *)sender;
    
    if([button isClicked]){
        [button changeState];
        button.alpha = 1;
        
        [clickedButtons removeObject:button];
        sum-=button.number;
        if(sum==goalNumber){
            [self goalAchieved];
        }
    }else{
        [button changeState];
        
        [clickedButtons addObject:button];
        sum+=button.number;
        
        if(sum==goalNumber){
            [self goalAchieved];
        }
        else if(sum>goalNumber){
            for(NumberButton * button in clickedButtons){
                [button randNumber];
                [button changeState];
            }
            [clickedButtons removeAllObjects];
            sum = 0;
        }
    }
}

- (void)goalAchieved{
    for(NumberButton * button in [topNumberButtonPanel subviews]){
        button.backgroundColor = [UIColor brownColor];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.03]];

    }
    for(NumberButton * button in [bottomNumberButtonPanel subviews]){
        button.backgroundColor = [UIColor brownColor];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.03]];
    }
    [self newGame];
    level++;
    levelLabel.text = [NSString stringWithFormat:@"%d", level];
}
- (void)newGame{
    // Number Label
    self.sum = 0;
    self.goalNumber = (arc4random() % 10) + 10;
    self.goalNumberLabel.text = [NSString stringWithFormat:@"%d", self.goalNumber];
    
    [clickedButtons removeAllObjects];
    
    [topNumberButtonPanel newGame];
    [bottomNumberButtonPanel newGame];
}

@end
