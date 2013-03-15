//
//  MapOptionsViewController.m
//  S5RPT
//
//  Created by Deni Bacic on 6. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "MapOptionsViewController.h"

@interface MapOptionsViewController ()

@end

@implementation MapOptionsViewController
@synthesize delegate = _delegate;
@synthesize mapTypeSegmentedControl = _mapTypeSegmentedControl;
@synthesize bandTypeSegmentedControl = _bandTypeSegmentedControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _mapTypeSegmentedControl.selectedSegmentIndex = _selectedMapSegmentIndex;
    _bandTypeSegmentedControl.selectedSegmentIndex = _selectedBandSegmentIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMapType:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (_delegate != nil) {
        [_delegate didCompleteOptionsSelection:sender];
    }
}

- (IBAction)changeBandType:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (_delegate != nil) {
        [_delegate didCompleteOptionsSelection:sender];
    }
}


- (void)setSelectedMapSegmentIndex:(NSInteger)index {
    _selectedMapSegmentIndex = index;
}
- (void)setSelectedBandSegmentIndex:(NSInteger)index {
    _selectedBandSegmentIndex = index;
}

- (IBAction)dismissOptions:(id)sender {
    //    [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (_delegate != nil) {
        [_delegate didCompleteOptionsSelection:nil];
    }
}
@end