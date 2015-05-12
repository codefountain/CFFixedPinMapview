//
//  ViewController.m
//  CFFixedPinMapview
//
//  Created by Sabatino Masala on 12/05/15.
//  Copyright (c) 2015 CondeFountain. All rights reserved.
//

#import "ViewController.h"
#import "CFFixedPinMapView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  CFFixedPinMapview *map = [[CFFixedPinMapview alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  [self.view addSubview:map];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
