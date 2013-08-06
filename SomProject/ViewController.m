//
//  ViewController.m
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import "ViewController.h"
#import "NumberButtonPanel.h"

@interface ViewController (){
    NumberButtonPanel * topNumberButtonPanel;
    NumberButtonPanel * bottomNumberButtonPanel;
}

- (void)buttonClicked:(id)sender;

@end

@implementation ViewController

//@synthesize buttons;

- (void)viewDidLoad
{
    [super viewDidLoad];
    topNumberButtonPanel = [[NumberButtonPanel alloc] initWithOrigin:1 y:80];
    bottomNumberButtonPanel = [[NumberButtonPanel alloc] initWithOrigin:1 y:self.view.frame.size.height-159];
    
    [self.view addSubview:topNumberButtonPanel];
    [self.view addSubview:bottomNumberButtonPanel];
}

- (void)buttonClicked:(id)sender{
    NSLog(@"buttonClicked");
}

@end
