//
//  Pin.h
//  DraggablePin
//
//  Created by Sabatino Masala on 12/05/15.
//  Copyright (c) 2015 CondeFountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFFixedPin : UIView

@property (weak, nonatomic) UIImageView *pin;
@property (weak, nonatomic) UIImageView *shadow;
@property (assign, nonatomic) CGPoint startPosition;
@property (assign, nonatomic) BOOL canLayout;

- (void)dragAni;
- (void)dropAni;

@end
