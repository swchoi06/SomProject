//
//  ViewController.h
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberButtonPanel.h"

@interface ViewController : UIViewController <NumberButtonPanelDelegate>

@property (nonatomic, strong) IBOutlet UILabel * levelLabel;
@property (nonatomic, strong) IBOutlet UILabel * goalNumberLabel;
@property (nonatomic) int level;
@property (nonatomic) int goalNumber;

@property (nonatomic) int sum;
@end
