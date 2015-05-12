//
//  Pin.m
//  DraggablePin
//
//  Created by Sabatino Masala on 12/05/15.
//  Copyright (c) 2015 CondeFountain. All rights reserved.
//

#import "CFFixedPin.h"

@implementation CFFixedPin

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    
    _canLayout = YES;
    
    UIImageView *pin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin"]];
    [self addSubview:pin];
    _pin = pin;
    
    UIImageView *shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shadow"]];
    [self addSubview:shadow];
    shadow.alpha = .25f;
    _shadow = shadow;
    
  }
  return self;
}

- (void)layoutSubviews {
  
  [super layoutSubviews];
  
  if (self.canLayout) {
    
    CGRect frame = self.frame;
    self.pin.frame = CGRectMake(frame.size.width * .5 - self.pin.frame.size.width * .5, frame.size.height * .5 - self.pin.frame.size.height, self.pin.frame.size.width, self.pin.frame.size.height);
    if(CGPointEqualToPoint(CGPointZero, self.startPosition)){
      self.startPosition = self.pin.frame.origin;
    }
    
    self.shadow.frame = CGRectMake(frame.size.width * .5 - self.shadow.frame.size.width * .5, frame.size.height * .5 - 1, self.shadow.frame.size.width, self.shadow.frame.size.height);
    
  }
  
}

- (void)dragAni {
  
  self.canLayout = NO;
  
  [UIView animateWithDuration:.2f animations:^{
    self.shadow.transform = CGAffineTransformMakeScale(.4, .4);
    self.pin.frame = CGRectMake(self.pin.frame.origin.x, self.startPosition.y - 15, self.pin.frame.size.width, self.pin.frame.size.height);
    self.shadow.alpha = .5f;
  } completion:^(BOOL finished) {
    self.canLayout = YES;
  }];

}

- (void)dropAni {
  
  self.canLayout = NO;
  
  [UIView animateWithDuration:.2f animations:^{
    self.shadow.alpha = .25f;
    self.shadow.transform = CGAffineTransformMakeScale(1, 1);
    self.pin.frame = CGRectMake(self.startPosition.x, self.startPosition.y, self.pin.frame.size.width, self.pin.frame.size.height);
  } completion:^(BOOL finished) {
    self.canLayout = YES;
  }];
  
}

@end
