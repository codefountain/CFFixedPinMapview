//
//  DraggableMap.h
//  DraggablePin
//
//  Created by Sabatino Masala on 12/05/15.
//  Copyright (c) 2015 CondeFountain. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "CFFixedPin.h"

@interface CFFixedPinMapview : UIView <MKMapViewDelegate>

@property (weak, nonatomic) MKMapView *mapview;
@property (weak, nonatomic) CFFixedPin *pin;

@property (assign, nonatomic) BOOL dragging;

@end
