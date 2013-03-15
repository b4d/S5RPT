//
//  DetailsViewController.h
//  S5RPT
//
//  Created by Deni Bacic on 8. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repeater.h"


@interface DetailsViewController : UITableViewController {
    Repeater *rpt;
}

@property (weak, nonatomic) IBOutlet UILabel *labelId;
@property (weak, nonatomic) IBOutlet UILabel *labelInput;
@property (weak, nonatomic) IBOutlet UILabel *labelOutput;
@property (weak, nonatomic) IBOutlet UILabel *labelRpt;
@property (weak, nonatomic) IBOutlet UILabel *labelLoc;
@property (weak, nonatomic) IBOutlet UILabel *labelAsl;
@property (weak, nonatomic) IBOutlet UILabel *labelNote;
@property (weak, nonatomic) IBOutlet UILabel *labelOwner;
@property (weak, nonatomic) IBOutlet UILabel *labelSysop;
@property (weak, nonatomic) IBOutlet UILabel *labelTone;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;



//sent from map
@property (nonatomic, strong) Repeater *rpt;

@end


/*
 <ID>S55VBO</ID>
 <Name>Kobla</Name>
 <Band>2</Band>
 <Input>145.0375</Input>
 <Output>145.6375</Output>
 <Rpt>RV51</Rpt>
 <Loc>JN66xf</Loc>
 <Asl>1470</Asl>
 <Note>/</Note>
 <Owner>S53GA, S59DBO</Owner>
 <Sysop>S53GA</Sysop>
 <Lon>13.96108333333333</Lon>
 <Lat>46.24083333333334</Lat>
 <Status>1</Status>
 <Tone>TX 123.0</Tone>

*/