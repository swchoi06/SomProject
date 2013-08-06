//
//  NumberButtonPanel.m
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import "NumberButtonPanel.h"

@interface NumberButtonPanel ()

- (void)buttonClicked:(id)sender;

@end

@implementation NumberButtonPanel

- (id)initWithOrigin:(int)x y:(int)y{
    self = [super initWithFrame:CGRectMake(x, y, 159, 318)];
    [self buttonGenerator];
    return self;
}
 
- (void)buttonGenerator{
    for(int i=0; i<3; i++){
        for(int j=0; j<6; j++){
            NumberButton * button = [NumberButton new];
            button.frame = CGRectMake(53*j, 53*i, 53, 53);
            button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [button setTitle:@"1" forState:UIControlStateNormal];
            button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
            [button setUserInteractionEnabled:YES];
            
            [self addSubview:button];
        }
    }
}
- (void)buttonClicked:(id)sender{
    NSLog(@"buttonClicked");
}

@end
