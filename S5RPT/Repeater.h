//
//  Repeater.h
//  S5RPT
//
//  Created by Deni Bacic on 1. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Repeater : NSObject {
    NSString *ID;
    NSString *Name;
    NSString *Band;
    NSString *Input;
    NSString *Output;
    NSString *Rpt;
    NSString *Loc;
    NSString *Asl;
    NSString *Note;
    NSString *Owner;
    NSString *Sysop;
    NSString *Lon;
    NSString *Lat;
    NSString *Status;
    NSString *Tone;

}

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Band;
@property (nonatomic, retain) NSString *Input;
@property (nonatomic, retain) NSString *Output;
@property (nonatomic, retain) NSString *Rpt;
@property (nonatomic, retain) NSString *Loc;
@property (nonatomic, retain) NSString *Asl;
@property (nonatomic, retain) NSString *Note;
@property (nonatomic, retain) NSString *Owner;
@property (nonatomic, retain) NSString *Sysop;
@property (nonatomic, retain) NSString *Lon;
@property (nonatomic, retain) NSString *Lat;
@property (nonatomic, retain) NSString *Status;
@property (nonatomic, retain) NSString *Tone;

@end
