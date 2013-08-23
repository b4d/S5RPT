//
//  MapPin.h
//  QRZ.si
//
//  Created by Deni Bacic on 27. 01. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Repeater.h"

@interface MapPin : NSObject<MKAnnotation> {
    
    BOOL status;
    
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readwrite) MKPinAnnotationColor pinColor;
@property (nonatomic, readwrite) Repeater *repeater;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName description:(NSString *)description pinColor:(MKPinAnnotationColor)pinColor repeater:(Repeater *)repeater;

@end