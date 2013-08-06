//
//  NumberButtonPanel.h
//  SomProject
//
//  Created by SukWon Choi on 13. 8. 5..
//  Copyright (c) 2013년 Wafflestudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberButton.h"


@protocol NumberButtonPanelDelegate <NSObject>

-(void)buttonClicked:(id)sender;

@end

@interface NumberButtonPanel : UIView

// Delegate
@property (nonatomic, weak) id <NumberButtonPanelDelegate> delegate;

- (id)initWithOrigin:(int)x y:(int)y;
- (void)buttonGenerator;
- (void)newGame;
@end
