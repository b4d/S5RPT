//
//  S5RPTViewController.h
//  S5RPT
//
//  Created by Deni Bacic on 1. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapOptionsViewController.h"
#import "Repeater.h"
#import "MKCircleViewGradient.h"

@class S5RPTAppDelegate;

@interface S5RPTViewController : UIViewController<MKMapViewDelegate, MapOptionsViewControllerDelegate> {
    
    IBOutlet CLLocationManager *locationManager;

    S5RPTAppDelegate *appDelegate;
    
    NSInteger _currentMapType;
    NSInteger _currentBandType;
    
    NSString *band;

    
}

@property (nonatomic, retain) IBOutlet MKMapView *myMapView;

@property (nonatomic, strong) NSMutableArray *repeaters;
@property (nonatomic, strong) Repeater *savedRepeaterFromPin;

@end


