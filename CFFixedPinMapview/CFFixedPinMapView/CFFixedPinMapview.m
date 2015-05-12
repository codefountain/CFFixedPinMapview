//
//  DraggableMap.m
//  DraggablePin
//
//  Created by Sabatino Masala on 12/05/15.
//  Copyright (c) 2015 CondeFountain. All rights reserved.
//

#import "CFFixedPinMapview.h"

@implementation CFFixedPinMapview

- (instancetype)initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]){
    
    _dragging = NO;
    
    MKMapView *mapview = [[MKMapView alloc] initWithFrame:frame];
    [self addSubview:mapview];
    mapview.delegate = self;
    _mapview = mapview;
    
    CFFixedPin *pin = [[CFFixedPin alloc] initWithFrame:frame];
    pin.userInteractionEnabled = NO;
    [self addSubview:pin];
    _pin = pin;
    
  }
  return self;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
  
  if (self.dragging) {
    self.dragging = NO;
  }
  
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
  
  if (!self.dragging) {
    self.dragging = YES;
  }
  
}

- (void)setDragging:(BOOL)dragging {
  
  if (_dragging != dragging) {

    _dragging = dragging;

    if (_dragging) {
      [self.pin dragAni];
    } else {
      [self.pin dropAni];
    }
    
  }

}

- (void)layoutSubviews {
  
  CGRect frame = self.frame;
  self.pin.frame = CGRectMake(frame.size.width * .5 - self.pin.frame.size.width * .5, frame.size.height * .5 - self.pin.frame.size.height * .5, self.pin.frame.size.width, self.pin.frame.size.height);

}

#pragma Getters

// Equals the center of the map
- (CGPoint)position {
  return self.mapview.center;
}

@end
