//
//  MapPin.m
//  QRZ.si
//
//  Created by Deni Bacic on 27. 01. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "MapPin.h"


@implementation MapPin

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize pinColor;
@synthesize repeater;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:placeName description:description pinColor:(MKPinAnnotationColor)color repeater:rpt{
    self = [super init];
    if (self != nil) {
        coordinate = location;
        title = placeName;
        subtitle = description;
        pinColor = color;
        repeater = rpt;
    }
    return self;
}

- (void)dealloc {

}




@end