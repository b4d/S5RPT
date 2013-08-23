//
//  S5RPTViewController.m
//  S5RPT
//
//  Created by Deni Bacic on 1. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "S5RPTViewController.h"
#import "Repeater.h"
#import "S5RPTAppDelegate.h"
#import "MapPin.h"
#import "XMLParser.h"
#import "DetailsViewController.h"

@interface S5RPTViewController ()

@end

@implementation S5RPTViewController

@synthesize myMapView, repeaters, savedRepeaterFromPin;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _currentMapType = 0;
    _currentBandType = 1;
    band = @"2";
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:104/255.0f
                                                                          green:1/255.0f
                                                                           blue:22/255.0f
                                                                          alpha:1.0f]];
    
    [self.navigationController.navigationBar setTranslucent:YES];

    
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    appDelegate = (S5RPTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self refreshData];
    

    
    myMapView.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self refreshMap];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 3.0f;
    span.longitudeDelta = 3.0f;
    
    
    region.span = span;
    region.center = CLLocationCoordinate2DMake(46.119944,14.815333); //geoss
    //region.center=CLLocationCoordinate2DMake(39.046259, -76.851195);
    [self.myMapView setRegion:region animated:NO];
    
}

-(void)refreshMap {
    appDelegate = (S5RPTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [myMapView removeAnnotations:myMapView.annotations];
    [myMapView removeOverlays:self.myMapView.overlays];
    
    for (Repeater *rpt in appDelegate.repeaters) {
        //NSLog(@"%@", rpt.Name);
        if ([rpt.Band isEqualToString:band]) {
            


            MapPin *pin = [[MapPin alloc] initWithCoordinates:CLLocationCoordinate2DMake([rpt.Lat doubleValue], [rpt.Lon doubleValue])
                                                    placeName:[NSString stringWithFormat:@"%@, %@ ", rpt.Rpt, rpt.Name]
                                                  description:[NSString stringWithFormat:@"%@, %@, %@", rpt.Input, rpt.Output, rpt.Tone]
                                                     pinColor:[self chooseColorForRepeater:rpt]
                                                     repeater:rpt];

            
            
            [self.myMapView addAnnotation:pin];
            
            if ([rpt.Status isEqualToString:@"1"]) {
                MKCircle *circle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake([rpt.Lat doubleValue],
                                                                                                   [rpt.Lon doubleValue])
                                                             radius:60*[rpt.Asl integerValue]];
                [self.myMapView addOverlay:circle];
            }
            
        }
    }
}

-(MKPinAnnotationColor) chooseColorForRepeater:(Repeater *)rpt {
    if ([rpt.Status isEqualToString:@"1"])
        return MKPinAnnotationColorGreen;
    return MKPinAnnotationColorRed;
}

- (MKOverlayView *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
{
    MKCircleView *circleView = [[MKCircleViewGradient alloc] initWithOverlay:overlay];
//    MKCircleView *circleView = [[MKCircleView alloc] initWithOverlay:overlay];
//    circleView.strokeColor = [UIColor blackColor];
//    circleView.lineWidth = 1;
//    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    return circleView;
}

- (void)refreshData {
    
    // START PARSING
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://b4d.sablun.org/s5rpt.xml"];
    
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	BOOL success = [xmlParser parse];
	
	if(success)
		NSLog(@"No Errors");
	else {
        [self performSelectorOnMainThread:@selector(alertConnectionError) withObject:@"Error!" waitUntilDone:YES];
    }
    
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    

            MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:(MapPin <MKAnnotation> *)annotation reuseIdentifier:@"currentloc"];
            pinView.canShowCallout = YES;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
            [rightButton setTitle:annotation.title forState:UIControlStateNormal];
            [pinView setRightCalloutAccessoryView:rightButton];
            
//            UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
//            [leftButton setTitle:annotation.title forState:UIControlStateNormal];
//            [pinView setLeftCalloutAccessoryView:leftButton];
            
            MapPin *x = annotation;
            pinView.pinColor = x.pinColor;
       
        return pinView;
}




- (void)mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    MapPin *pin = (MapPin *)view.annotation;
    savedRepeaterFromPin = pin.repeater;
    
    if ([(UIButton*)control buttonType] == UIButtonTypeInfoLight){
        [self performSegueWithIdentifier:@"detailsSegue" sender:[self navigationController]];
    } else if([(UIButton*)control buttonType] == UIButtonTypeInfoDark) {
        NSLog(@"info");
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"optionsSegue"]) {
        
        MapOptionsViewController *mapOptionsViewController = segue.destinationViewController;
        mapOptionsViewController.delegate = self;
        [mapOptionsViewController setSelectedMapSegmentIndex:_currentMapType];
        [mapOptionsViewController setSelectedBandSegmentIndex:_currentBandType];
    
    } else if ([[segue identifier] isEqualToString:@"detailsSegue"]) {
        
        DetailsViewController *detailsViewController = segue.destinationViewController;
        detailsViewController.rpt = savedRepeaterFromPin;
        
        
    }
}

- (void)didCompleteOptionsSelection:(id)sender {
    if (sender != nil) {
        UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
        
        NSInteger index = segmentedControl.selectedSegmentIndex;
        if (segmentedControl.tag == 1) {
            switch (index) {
                case 0:
                    myMapView.mapType = MKMapTypeStandard;
                    _currentMapType = index;
                    break;
                case 1:
                    myMapView.mapType = MKMapTypeHybrid;
                    _currentMapType = index;
                    break;
                case 2:
                    myMapView.mapType = MKMapTypeSatellite;
                    _currentMapType = index;
                    break;
                default:
                    index = 0;
                    myMapView.mapType = MKMapTypeStandard;
                    break;
            }
        } else if (segmentedControl.tag == 2) {
            switch (index) {
                case 0:
                    NSLog(@"6m");
                    band = @"6";
                    _currentBandType = index;
                    [self refreshMap];
                    break;
                case 1:
                    NSLog(@"2m");
                    band = @"2";
                    _currentBandType = index;
                    [self refreshMap];
                    break;
                case 2:
                    NSLog(@"70cm");
                    band = @"70";
                    _currentBandType = index;
                    [self refreshMap];
                    break;
                case 3:
                    NSLog(@"D-STAR");
                    band = @"D-Star";
                    _currentBandType = index;
                    [self refreshMap];
                    break;
                case 4:
                    NSLog(@"Echolink");
                    band = @"echolink";
                    _currentBandType = index;
                    [self refreshMap];
                    break;
                default:
                    index = 0;
                    break;
            }
        }
        //[self.myMapView updateConstraints];
        
        
    }
}


-(void) alertConnectionError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Connection error!"
                                                    message: @"Check your connection settings and try again"
                                                   delegate: nil
                                          cancelButtonTitle: @"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
